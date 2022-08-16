# mitlib-tf-template

Template for Terraform repos for MIT Libraries.

After deploying this, the following steps must be completed.

1. Update the `terraform { }` block in [main.tf](./main.tf). We now use the `cloud {}` block to link to workspaces in Terraform Cloud. The very first thing to do is set the correct tags in the `workspaces {}` block.
1. Update [main.tf](./main.tf) to include any additional Terraform Provider(s).
1. Update the `terraform { required_providers { } }` block in [versions.tf](./versions.tf) to set the location and constraints on the additional providers.
1. **Optional**: Update the `locals {}` block in [main.tf](./main.tf) to provide a project-id.
1. **Optional**: Update the `tags {}` block in [providers.tf](./providers.tf) to enable a backup plan via AWS Backups
1. Copy the `locals {}` block from the [deleteme.tf](./deleteme.tf) file and paste it into each `.tf` file that will create named resources.
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

## TF markdown is automatically inserted at the bottom of this file, nothing should be written beyond this point

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.2 |
| aws | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.0 |

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
