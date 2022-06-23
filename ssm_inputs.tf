################################################################################
# This is used to simplify the SSM Parameter inputs
locals {
  vpc_vars  = "/tfvars/vpc"
  r53_vars  = "/tfvars/r53"
  init_vars = "/tfvars/init"
}

### We do additional checks for user-inputted values including:
### 1. Checking for trailing/leading spaces in the SSM parameters (we expect none)
### 2. Outputting them if they are not securestrings so that we can check them in tfc

## Each aws_ssm_parameter data object needs a brief description of the value stored
##  in the parameter (Type & Datatype refer to settings in AWS, Format refers to 
##  what Terraform thinks the value is). 
## We do additional checks for user-inputted values including:
##  1. Checking for trailing/leading spaces in the SSM parameters (we expect none)
##  2. Outputting them if they are not securestrings so that we can check them in tfc
## The general format of an input from SSM Parameter Store should look like:
#
# # Type:string  Datatype:test  Format:string
# data "aws_ssm_parameter" "name_of_parameter" {
#   name = "${var.tfinput_ssm_path}/name-of-parameter"
#   lifecycle {
#     postcondition {
#       condition     = trimspace(self.value) == self.value
#       error_message = "There is a leading or trailing blank space."
#     }
#   }
# }
# # Output user set ssm parameters for clarity of plans and applies
# output "name_of_parameter" {
#   value = data.aws_ssm_parameter.name_of_parameter.type == "SecureString" ? "Suppressed: SecureString" : nonsensitive(data.aws_ssm_parameter.name_of_parameter.value)
# }
