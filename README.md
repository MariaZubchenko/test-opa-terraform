# Test Open Policy Agent with Terraform plan 
This example shows how OPA works with Terraform plans

## To start testing:
`opa eval --format pretty --data terraform.rego --input tfplan.json "data.terraform"`

## If in tfplan.json you have: 
`"instance_type": "t3.micro"` 

### or any other instance type, you will get:
```
{
  "deny": [
    "Instance type t3.micro not allowed."
  ],
  "it_types": [
    "t2.micro"
  ]
}
```
## If in tfplan.json you have: 
`"instance_type": "t2.micro"`

## you will get:
```
{
  "deny": [],
  "it_types": [
    "t2.micro"
  ]
}
```


