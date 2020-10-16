# Test Open Policy Agent with Terraform plan 

## To start testing:
`opa eval --format pretty --data terraform.rego --input tfplan.json "data.terraform.analysis.authz"`

