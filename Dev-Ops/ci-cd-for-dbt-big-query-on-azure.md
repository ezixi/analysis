---
seo_description: "Creating a CI/CD Azure Pipeline for a dbt data warehouse on Google Big Query"
---

# CI/CD For a dbt Data Warehouse on Google Big Query Using Azure Pipelines

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

variables:
  PIP_CACHE_DIR: $(Pipeline.Workspace)/.pip

steps:
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

  - checkout: self
    submodules: true
    path: <repo name>

  - task: Cache@2
    inputs:
      key: 'python | "$(Agent.OS)" | requirements.txt'
      restoreKeys: |
        python | "$(Agent.OS)"
        python
      path: $(PIP_CACHE_DIR)
    displayName: Cache pip packages

  - script: |
      mkdir ~/.dbt
      echo Installing $(SettingProfile.secureFilePath) to the ~/.dbt...
      cp $(SettingProfile.secureFilePath) ~/.dbt/profiles.yml
      echo Installing $(GettingServiceAccount.secureFilePath) to the ~/.dbt...
      cp $(GettingServiceAccount.secureFilePath) ~/.dbt/<name of service account creds>
    displayName: Installing Profile

  - script: |
      export PATH=$PATH:/home/vsts_azpcontainer/.local/bin
      pip install -r requirements.txt
      cd $(Pipeline.Workspace)/<repo name>
      dbt run
      dbt test
    displayName: 'Run and Test'
```
