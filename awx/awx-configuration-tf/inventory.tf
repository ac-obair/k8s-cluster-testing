resource awx_inventory "test-inventory-added-by-tf" {
  name            = "test-inventory-added-by-tf"
  organisation_id = awx_organization.arnoldclark.id
  variables       = <<YAML
---
system_supporters:
  - pi
YAML
}

resource awx_inventory_group "test-inventory-added-by-tf" {
    name           = "test-group-added-by-tf"
    description    = "test group added by tf"
    inventory_id   = awx_inventory.test-inventory-added-by-tf.id
    variables      =  <<YAML
---
test: 1234
YAML
}