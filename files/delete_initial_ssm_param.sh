### Template Script for deleting the "manual" SSM Parameter Store values

## This is not a real bash script, just a list of AWS CLI commands and dummy
## values that can be used to delete all of the required SSM Param Store
## values needed by Ansible

# aws ssm delete-parameter --name "/tfvars/(app name)/(example-ssm-param)"
