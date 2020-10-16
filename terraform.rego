package terraform.analysis.authz

import input as tfplan
import input.tfrun as tfrun
import data.tfplan
 
# allowed_instance_types = {
#     "instance_type": ["t2.micro"]
# }

allowed_resources = {
    "instance_type": ["t2.micro"]
}


deny[reason] {
    instance_type := input.planned_values.root_module.resources[0].values[_]
    not instancetype(instance_type)
    reason := "Wrong instance type"
    #not allowed_resources with input as {"aws_instance": [""]}

    # resource := data.tfplan.planned_values.root_module.resources.values
    
    # not array_contains(allowed_resources, resource.type)

    # reason := sprintf(
    #     "%s: resource type %q is not allowed",
    #     [resource.address, resource.type]
    # )
}

instancetype(instance_type) {
    tfplan.planned_values.root_module.resources[0].values.instance_type
}

# res := data.tfplan.planned_values.root_module.resources.values

# resources := [r | r = res[_]; allowed_instance_types[_] == r.instance_type]

#  default authz = false
#  authz {
#     aws_instance := allowed_resources
#  }


