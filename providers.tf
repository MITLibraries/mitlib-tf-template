################################################################################
# Providers are now separated out into their own file. Version and source
# constraints for these providers are still set in the `versions.tf` file.

# Here we also set the default tags used in all our projects, 
# mandatory tags are already included, and should not be removed. The 
# project-id tag is set to null as a default. If it needs to be set, that happens
# in main.tf.
# Optional tags are in comments below:
#  app-repo   = "name of GitHub repo for app that depends on this infrastructure"
#  backup_enable = true/false (determines if AWS Backup backs up tagged resources)
#  backup_type = "local" || "remote" (determines if AWS Backup copies the recovery 
#                                     point to a separate AWS Account)
#  backup_length = "7" || "14" || "30" (determines retention period for recovery 
#                                       points)
# These values can be set here and they will apply to all resources created by this
# repo. Or, these can be set as additional tags on individual resources.


provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      project-id   = local.project_id == null ? null : "${local.project_id}"
      app-id       = var.name
      environment  = var.environment
      ou           = var.ou
      terraform    = "true"
      infra-repo   = "mitlib-tf-${var.ou}-${var.name}"
      contains-pii = "false"
    }
  }
}
