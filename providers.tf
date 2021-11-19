# Providers are now separated out into their own file. Version and source
# constraints for these providers are still set in the `versions.tf` file.

# Here we also set the default tags used in all our projects, 
# mandatory tags are already included, and should not be removed
# Optional tags are in comments below:
#  app-repo   = "name of GitHub repo for dependent app"
#  project-id  = "if this is part of a larger project, that project name"

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      app-id       = var.name
      environment  = var.environment
      ou           = var.ou
      terraform    = "true"
      infra-repo   = "mitlib-tf-${var.name}"
      contains-pii = "false"
    }
  }
}
