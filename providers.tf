# Providers are now separated out into their own file. Version and source
# constraints for these providers are still set in the `versions.tf` file.

# Here we also set the default tags used in all our projects
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      app-id       = var.name
      environment  = var.environment
      ou           = var.ou
      terraform    = "true"
      repo         = "mitlib-tf-${var.name}"
      contains-pii = "false"
    }
  }
}
