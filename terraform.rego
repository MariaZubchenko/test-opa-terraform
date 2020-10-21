package terraform

import input.tfplan as tfplan
import input as tfplan

array_contains(arr, elem) {
  arr[_] = elem
}

it_types = [
  "t2.micro",
]
 
deny[reason] {
  r := tfplan.planned_values.root_module.resources[_]
  it := r.values.instance_type
  not array_contains(it_types,it)
  reason := sprintf("Instance type %s not allowed.",[it])
}
