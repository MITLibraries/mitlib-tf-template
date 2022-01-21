# main.tf for basic Terraform config. Since all of these repos are linked
# to Terraform Cloud, the "backend" configuration below can be deleted unless
# there is a need to run the Terraform CLI locally and still use a remote
# backend (in which case, the workspace name will need to be set).

terraform {
  backend "remote" {
    organization = "MITLibraries"

    workspaces {
      name = ""
    }
  }
}

# The following is part of the default naming scheme for resources created
# by Terraform. This defaults to null, but should be updated if this infrastructure
# is part of a large project. Note that this value is used in the providers.tf
# file.
locals {
  project_id = null # change to "project-id-name" if this is part of a larger project
}
