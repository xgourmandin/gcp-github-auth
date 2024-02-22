# gcp-github-auth

a Terraform project to connect a Github account with GCP Workload Identity.\
This repository is not meant to be a Terraform module, but a starter project to connect your Github account with your GCP project.

Feel free to use it as a starting point. If you're making improvements on this, please consider making a pull request.

## Prerequisites

- A GCP project
- A Github repository (at least one, but this project is designed to handle multiple repositories)
- Permissions for your user in the GCP Project (Start with `role/editor` if you're not sure)

## Usage

### Apply the Terraform project

Make a copy of the `terraform.example.tfvars` file and name it `terraform.tfvars`. Fill in the required variables.

```bash
cp terraform.example.tfvars terraform.tfvars
```

By default, the Terraform state is stored locally. You can change this by modifying the `provider.tf` file and setting the `backend` block. [Terraform backend Docs](https://www.terraform.io/docs/language/settings/backends/index.html) 

Then apply the Terraform project:

```bash
terraform init
terraform apply
```

### Configure your Github Action CI/CD

Once applied to your GCP project, use the following Github Action template to connect to your GCP account and start
making change to your infrastructure:

```yaml
on:
  push:
  workflow_dispatch:

jobs:

  build:
    runs-on: ubuntu-latest
    permissions:
      contents: 'read'
      id-token: 'write'
    steps:
      - uses: actions/checkout@v4
      - name: Authenticate to Google Cloud
        uses: 'google-github-actions/auth@v2'
        with:
          token_format: 'access_token'
          workload_identity_provider: ${{ vars.WORKLOAD_ID_PROVIDER }}
          service_account: ${{ vars.SERVICE_ACCOUNT_EMAIL }}
      - name: Login to Artifact Registry # Example with a login to Artifact registry
        uses: docker/login-action@v3
        with:
          registry: europe-west1-docker.pkg.dev
          username: oauth2accesstoken
          password: ${{ steps.auth.outputs.access_token }}
```