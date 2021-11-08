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
