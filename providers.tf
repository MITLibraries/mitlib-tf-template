# Providers are now separated out into their own file. Version and source
# constraints for these providers are still set in the `versions.tf` file.

provider "aws" {
  region = var.aws_region
}
