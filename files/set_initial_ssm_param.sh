### This is not actually a shell script, copy/paste these lines after editing
### them locally into cloudshell to set parameters easily. 

## Application configuration variables
# Note: SSM objects provided through the console are dev/test/prod environment
# specific and/or may be sensitive. Those values may be retrieved through 
# LastPass or from the Infra-Data team.

# aws ssm put-parameter --name "/tfvars/apps-vars/(app name)/(example-ssm-param)" --type "String" --description "(example description)" --overwrite --value "(example value)"
# aws ssm put-parameter --name "/tfvars/apps-vars/(app name)/(example-ssm-secure-param)" --type "SecureString" --description "(example description)" --overwrite --value "(example secure value)"
