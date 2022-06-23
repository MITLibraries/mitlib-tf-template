################################################################################
# Providers are now separated out into their own file. Version and source
# constraints for these providers are still set in the `versions.tf` file.

# Here we also set the default tags used in all our projects, 
# mandatory tags are already included, and should not be removed. The 
# project-id tag is set to null as a default. If it needs to be set, that happens
# in main.tf.
# Optional tags are in comments below:
#  app-repo   = "name of GitHub repo for app that depends on this infrastructure"
#  backup_enabled = true/false (determines if AWS Backup backs up tagged resources)
#  backup_type = "local_30" || "local_14" || "local_7" || "remote_30" || "remote_14" (pick one, see mitlib-tf-workloads-awsbackups for details)


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
