# Application for Zühlke Camp 2022 project

[![GitHub pages deployment](https://github.com/nils-s/z-camp-2022-application/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/nils-s/z-camp-2022-application/actions/workflows/pages/pages-build-deployment)
[![GitHub license](https://img.shields.io/github/license/nils-s/z-camp-2022-application?color=blue)](https://github.com/nils-s/z-camp-2022-application/blob/master/LICENSE)

This repo contains a simple Spring Boot application (created via the
[spring initializr](https://start.spring.io)) that can be run on the infrastructure defined in the
corresponding [infrastructure repo](https://github.com/nils-s/z-camp-2022-infrastructure).
For convenience (and to play around with git submodules), the infrastructure repo is also included
in the [terraform folder](./terraform) as a git submodule.

## Building the Application

The [.github folder](./.github/workflows) contains a GitHub actions workflow to build the app
binary (i.e. a jar file), as well as a container image using the binary. The action will also push
the container image to the container registry defined in the infrastructure repo.

To be able to push the image to the registry, the credentials of the Azure service user for pushing
images need to be added to GitHub as repository action secrets:

- a secret named `ACR_IMAGE_PUSH_USER_CLIENT_ID` containing the service user's client ID
- a secret named `ACR_IMAGE_PUSH_USER_PASSWORD` containing the service user's client secret

The action can then be triggered manually in GitHub[^note-manual-trigger].
To run it automatically (e.g. on every commit to the main branch), simply change the trigger
on line 2 in [the workflow definition file](./.github/workflows/build-image.yml) from

```
on: workflow_dispatch
```

to

```
on:
  push:
    branches:
      - main
```

[^note-manual-trigger]:
    manual triggering was chosen so that
    1. limited GitHub actions minutes in the original (private) repo could be saved
    2. the Azure deployment is not triggered automatically, since the infrastructure
        might not be available (to save costs, it was/is only created when needed, and destroyed
        once it is no longer used)

## Deploying the Application

Once the container image has been pushed to the registry, it can be deployed to the Kubernetes
cluster using helm. The helm chart is in the [obvious location](./helm/camp22), and the
corresponding [readme file](./helm/README.md) contains more information on how to deploy and
try out the application
