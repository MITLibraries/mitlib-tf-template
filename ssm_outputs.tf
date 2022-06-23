# Output
# Each aws_ssm_parameter resource object needs a brief description of the value stored
#  in the parameter (Type & Datatype refer to settings in AWS, format refers to 
#  what Terraform thinks the value is). The general form of an output to SSM Parameter
#  Store should look like:
#
# # Type:string  Datatype:test  Format:string
# resource "aws_ssm_parameter" "name_of_parameter" {
#   #checkov:skip=CKV2_AWS_34:By default we are not encrypting parameters in tfoutput_ssm_path
#   type        = "String"
#   name        = "${var.tfoutput_ssm_path}/name-of-parameter"
#   value       = < the parameter value >
#   description = "Description of the parameter value"
#   overwrite   = true
# }
