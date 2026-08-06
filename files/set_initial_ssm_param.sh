### This is not actually a shell script, copy/paste these lines after editing
### them locally into cloudshell to set parameters easily. 

## Application configuration variables
# Note: SSM objects provided through the console are dev/test/prod environment
# specific and/or may be sensitive. Those values may be retrieved through 
# LastPass or from the Infra-Data team.

aws ssm put-parameter \
  --name "/tfvars/apps-vars/(app name)/(example-ssm-param)" \
  --type "String" \
  --description "(example description)" \
  --value "(example value)" \
  --tags '[{"Key":"app-id","Value":"<app-id>"}]'


# If you need to update a parameter after creating it, replace the `--tags `
# line with `--overwrite` (it is not possible to use the `--tags` option when 
# updating a parameter value).

# If you need to update the tags on an existing parameter, use the following
# aws ssm add-tags-to-resource \
#     --resource-type "Parameter" \
#     --resource-id "<parameter_name>" \
#     --tags '[{"Key":"app-id","Value":"vpc"}]'
