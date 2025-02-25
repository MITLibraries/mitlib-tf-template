# mitlib-tf-template

Template for Terraform repos for MIT Libraries.

After deploying this, the following steps must be completed.

1. Update the `terraform { }` block in [main.tf](./main.tf). We now use the `cloud {}` block to link to workspaces in Terraform Cloud. The very first thing to do is set the correct tags in the `workspaces {}` block.
1. Update [main.tf](./main.tf) to include any additional Terraform Provider(s).
1. Update the `terraform { required_providers { } }` block in [versions.tf](./versions.tf) to set the location and constraints on the additional providers.
1. **Optional**: Update the `locals {}` block in [main.tf](./main.tf) to provide a project-id.
1. **Optional**: Update the `tags {}` block in [providers.tf](./providers.tf) to enable a backup plan via AWS Backups
1. Copy the `locals {}` block from the [deleteme.tf](./deleteme.tf) file and paste it into each `.tf` file that will create named resources.
1. Update the [CODEOWNERS](./github/CODEOWNERS) file.
1. Update the Pre-Commit Actions programs in [.pre-commit-config](./pre-commit-config.yaml) to the latest versions.
1. Delete the [deleteme.tf](./deleteme.tf) file.
1. Delete the file tree below.

## File Tree

```bash
.
├── LICENSE
├── README.md
├── deleteme.tf
├── docs
│   └── adrs
│       ├── 0001-record-architecture-decisions.md
│       └── 0002-upgrade-to-cloud-block.md
├── files
│   └── README.md
│   └── delete_initial_ssm_param.sh
│   └── set_initial_ssm_param.sh
├── main.tf
├── modules
│   └── README.md
├── providers.tf
├── ssm_inputs.tf
├── ssm_outputs.tf
├── tests
│   └── README.md
├── variables.tf
└── versions.tf
```

## Pre-Commit

For proper linting and checking, this repo uses [pre-commit](https://pre-commit.com/) together with `pre-push` hooks. The following should be installed in the local workstation

* [pre-commit](https://pre-commit.com/)
* [terraform cli](https://developer.hashicorp.com/terraform/downloads)
* [terraform-docs](https://terraform-docs.io/)
* [checkov](https://github.com/bridgecrewio/checkov)

### Install pre-commit

After the first checkout locally, run the following command to initialize [pre-commit](https://pre-commit.com/) and link it to the git `pre-push` hook. This will allow you to make local commits as much as you want and no linting/checking will run. Only when you attempt to push your commits to GitHub will [pre-commit](https://pre-commit.com/) run the hooks.

```bash
pre-commit install --hook-type pre-push
```

### Run hooks on your own

It is possible to run the [pre-commit](https://pre-commit.com/) hooks manually. To run **all** the pre-commit hooks for this repo, run

```bash
pre-commit run --all-files
```

To run just the `checkov` checker, run

```bash
pre-commit run checkov
```

To run just the `terraform-docs` hook to update the README, run

```bash
pre-commit run terraform-docs-go
```

See [.pre-commit-config.yaml](./.pre-commit-config.yaml) for any other hooks that can be run.

## Requirements/Dependencies

This section provides descriptions of any requirements or dependencies that this infrastructure repository has. This may include other github repositories or any ParameterStore SSM objects that much be defined. As a documentation formatting example some repository and SSM requirements/dependencies are shown:

* ECR generated by [mitlib-tf-workloads-ecr](https://github.com/mitlibraries/mitlib-tf-workloads-ecr)
* GHA OIDC roles generated by [mitlib-tf-workloads-ecr](https://github.com/mitlibraries/mitlib-tf-workloads-ecr)
* Manual parameters set in SSM Parameter Store as inputs to this repo and passed to the container task as environment vars (see [set_initial_ssm_param.sh](files/set_initial_ssm_param.sh) and [delete_initial_ssm_param.sh](files/delete_initial_ssm_param.sh) for details)
* `log-level` (Debugging level for the application)

## Related Assets

This section provides descriptions of any infrastructure and application github repositories that this infrastructure application is related to. For example, this may be the Data Team's application repository for this project. It may also include base infrastructure repositories this infrastructure code depends on (such as ECR), or other application repositories that are part of a larger multi-app project. As a documentation formatting examples some sample repository dependencies are shown:

* [(DataApp) Application Container](https://github.com/MITLibraries/(DataApp)) - The (DataApp) Application Code
* [ECR Infrastructure](https://github.com/MITLibraries/mitlib-tf-workloads-ecr) - The ECR Infrastructure Repository

### IAM Roles and Policies for the task

This section provides descriptions of any IAM roles and policies that are created and defined.

### CloudWatch logs and Monitoring

This section provides a description of CloudWatch logging and any monitoring in place.

## Maintainers

* Owner: See [CODEOWNERS](./.github/CODEOWNERS)
* Team: See [CODEOWNERS](./.github/CODEOWNERS)
* Last Maintenance: YYYY-MM

## TF markdown is automatically inserted at the bottom of this file, nothing should be written beyond this point

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.10 |
| aws | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | 5.88.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| appinput\_ssm\_path | Standard prefix in Parameter Store for Terraform outputs specifically needed by <app-name> | `string` | n/a | yes |
| aws\_region | The AWS region where this infrastructure will be deployed. | `string` | `"us-east-1"` | no |
| environment | The name of the environment/stage/workspace (e.g., `stage`, `prod`, `dev`) | `string` | n/a | yes |
| mitlib | The shortname name of our MITLibraries Organization | `string` | `"mitlib"` | no |
| name | The name of the app/resource this code builds | `string` | n/a | yes |
| ou | The name of the AWS OU that contains the AWS Accounts that are managed by this code. | `string` | n/a | yes |
| tfinput\_ssm\_path | Standard prefix in Parameter Store for inputs to Terraform for initial infrastructure builds | `string` | n/a | yes |
| tfoutput\_ssm\_path | Standard prefix in Parameter Store for generic Terraform outputs (typically needed by other infra code) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
