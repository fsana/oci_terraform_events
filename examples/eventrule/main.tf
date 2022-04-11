# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

module "example_event_rules" {
  source                 = "../.."
  default_compartment_id = var.default_compartment_id
  event_rules            = var.event_rules
}
