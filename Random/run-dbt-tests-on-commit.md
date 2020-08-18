---
seo_description: "Run dbt Tests on Your Models Automatically On Commit"
---

# Run dbt Tests on Your Models Automatically On Commit

I love [dbt](https://www.getdbt.com/). There. I said it.

I first discovered it at one of my team's regular learning lunches; one of the Data Engineers suggested we watch a [demo from Fishtown Analytics](https://www.youtube.com/watch?v=qqlbYDfqeI4) and as soon as we gave it a spin it almost immediately solved many problems we were facing with managing database transformations in plain SQL and Python.

As we worked more with the framework we realised the benefits of simple documentation and tests. Tests were the best(s), but it always seemed to be something that I would have to remind my team to perform before they committed their changes to the repo. My solution was to force them to run tests before they commited. Using the [pre-commit framework](https://pre-commit.com/), it's a simple matter to make tests a requirement to a commit:

### 1. Install pre-commit:

```pip install pre-commit```

(and add it to your projects ```requirements.txt```)

### 2. Add a pre-commit configuration

Create a file named ```.pre-commit-config.yaml```

```yaml
    repos:
-   repo: local
    hooks:
    -   id: dbt_test
        name: run dbt test
        entry: run_dbt_test.sh
        language: script
        types: [file, sql]
        exclude: ^tests/
```

### 3. Create a local pre-commit hook to run your test

Create a file named ```run_dbt_test.sh```

Pre-commit usually uses a hook that can be pulled from a git repo (for example), but it can also be configured to run any local script. Here, I create a bash script that runs the ```dbt test``` command, excluding any sql in the /tests folder. I should probably write an actual hook that can be shared, but this works:

```bash

#!/bin/bash

fbname=$(basename "$1" .sql)

dbt test -m "$fbname"
```

### 4. Install the pre-commit hook

```pre-commit install```

Now, every time you make a change to a model, a test must pass on your local versions before it can be commited. I'd recommend only having a subset of data in your dev environment to make the tests run quickly, and making sure that _every_ model has an associated test.

Get the code from our [github repo](https://github.com/Backhand-Technology/dbt_tools).
