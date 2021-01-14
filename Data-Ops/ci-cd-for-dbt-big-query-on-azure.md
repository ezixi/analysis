---
feature_image: "https://backhand.tech/images/blog/anatomy_of_a_pipeline.png"
seo_description: "Creating a CI/CD Azure Pipeline for a dbt data warehouse on Google Big Query"
---

# Anatomy of A Pipeline: CI/CD For a dbt Data Warehouse on Google Big Query Using Azure Pipelines
<figure class="figure text-center"><img src="https://backhand.tech/images/blog/anatomy_of_a_pipeline.png" alt="Anatomy of A Pipeline: CI/CD For a dbt Data Warehouse on Google Big Query Using Azure Pipelines"/></figure>
Setting up continuous deployment for your dbt data warehouse has never been simpler. The big code repositories (Github, Gitlab and Azure Dev Ops) all offer tools that automate deploying model changes into production; usually by creating a docker container, pulling in all code and dependencies, running and then tearing it all down again.

Using [Azure Pipelines](https://azure.microsoft.com/en-gb/services/devops/pipelines/), this checkout and run process is specified in yaml that lives in your repo. Follow the steps below to automate the deployment of your dbt models on a Big Query data warehouse.

## Defaults

The first set of statements define global defaults for the repo.

The trigger states when the pipeline will run, and how. In this case, any change to the master branch will result in a deployment. Combine this with a ruleset in your repo that only allows merges to the master branch following an approved pull request and you’ll be able to leave the master branch alone knowing that your production systems are well tested and offer no surprises.

With `batch` set to true the system waits until the run is completed before starting another run with all changes that have not yet been built. This is helpful if there are multiple people committing changes to the branch at the same time.

The `pool` and `container` options specify the OS and Python version that the pipeline docker container will run on.

```yaml
---
trigger:
  batch: true
  branches:
    include:
      - master

pool:
  vmImage: 'ubuntu-latest'

container:
  image: python:3.8
```

## Variables

Azure has [predefined variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml) you can use in your pipeline, or you can [define your own](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch). Here, I set a location to store Python packages that I will cache in a [later step](#cache-dependencies).

I used the predefined variable `Pipeline.Workspace`, which supplies the working directory for the pipeline, to make things a little easier down the road.

```yaml
variables:
  PIP_CACHE_DIR: $(Pipeline.Workspace)/.pip
```

## Deployment Steps

The next few sections define the deployment steps that the pipeline will perform. The steps are carried out in the order they are listed.

### Checkout repo

The first step is to checkout the repo to get my models into the docker container. I specified `submodules` as true because I’m using dbt packages ([dbt_utils](https://github.com/fishtown-analytics/dbt-utils) for example) that I’ve defined as [git submodules](https://github.blog/2016-02-01-working-with-submodules/) within my repo. Although the recommended method of including packages in dbt is via [dbt hub](https://hub.getdbt.com/), using git allows me to specify the required package version and it gets added to my repo at the pipeline runtime.

Adding `path` as the name of my repo (e.g. ‘dbt’) was useful when referring to the model hierarchy in my dbt project definition. If you don’t do this, Azure defaults to naming the working directory to `s` and things can get confusing.

```yaml
steps:
  - checkout: self
    submodules: true
    path: <repo name>
```

### Download required files

The warehouse for this project is in Google Big Query. The best way I’ve found to connect dbt to Big Query is by specifying a link to a [service account key file](https://cloud.google.com/bigquery/docs/authentication/service-account-file#python) in `~/.dbt/profiles.yml`, so both of these files need downloading to the container.

Azure has a nice feature named [Secure Files](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/secure-files?view=azure-devops) where you can upload files with secrets in them to a secure area (separate from your versioned repo) that you can download into the container via a task in the pipeline. The files are deleted from the container after the pipeline runs.

```yaml
  - task: DownloadSecureFile@1
    name: GettingServiceAccount
    displayName: 'Downloading Service Account'
    inputs:
      secureFile: <name of service account creds>

  - task: DownloadSecureFile@1
    name: SettingProfile
    displayName: 'Downloading Profile'
    inputs:
      secureFile: 'profiles.yml'
```

### Cache Dependencies {#cache-dependencies}

Each time the Azure Pipelines job runs, all of dbt’s Python dependencies are downloaded from PyPI and added to the project. Given that the dependencies don’t change that often, it’s probably worth [caching the packages](https://docs.microsoft.com/en-us/azure/devops/pipelines/release/caching?view=azure-devops) for use across jobs - you do pay for the pipeline by the minutes used, after all.


```yaml
  - task: Cache@2
    inputs:
      key: 'python | "$(Agent.OS)" | requirements.txt'
      restoreKeys: |
        python | "$(Agent.OS)"
        python
      path: $(PIP_CACHE_DIR)
    displayName: Cache pip packages
```
Following the package definitions in your `requirements.txt` file, the task will look for cached packages in the `PIP_CACHE_DIR` I specified earlier. If the cache does not exist, the job will complete and dependencies will be added as part of the normal install later.

### Set Up dbt

To make sure that dbt runs correctly and has access to the warehouse, I create symlinks to the downloaded secure files in the `~/.dbt` folder. This means that dbt has access while ensuring that the secure files do get deleted after each run.

```yaml
  - script: |
      mkdir ~/.dbt
      echo Installing $(SettingProfile.secureFilePath) to the ~/.dbt...
      ln -s $(SettingProfile.secureFilePath) ~/.dbt/profiles.yml
      echo Installing $(GettingServiceAccount.secureFilePath) to the ~/.dbt...
      ln -s $(GettingServiceAccount.secureFilePath) ~/.dbt/<name of service account creds>
    displayName: Installing Profile
```

### Create and Test the dbt models

Finally, I install dbt, run the models and test them. The build will fail if the tests fail, alerting you to a problem, but the models will be built so it is important to get alerted to any errors. It’s also important to [run tests on your dbt models](https://analysis.backhand.tech/Data-Ops/run-dbt-tests-on-commit.html) throughout the software development lifecycle.

```yaml
  - script: |
      export PATH=$PATH:/home/vsts_azpcontainer/.local/bin
      pip install -r requirements.txt
      cd $(Pipeline.Workspace)/<repo name>
      dbt run
      dbt test
    displayName: 'Run and Test'
```

Of course, this pipeline is only a start. I’d like to improve it to only run changed models, and also regenerate and deploy the docs artifacts to a web server.
