### Template Script for deleting the "manual" SSM Parameter Store values

## This is not a real bash script, just a list of AWS CLI commands and dummy
## values that can be used to delete an SSM parameter that was created by the 
## commands in the `set_initial_ssm_param.sh`

# aws ssm delete-parameter --name "/tfvars/(app name)/(example-ssm-param)"
