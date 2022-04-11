# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "event_rules" {
  description = "The event rules, indexed by keys in var.topics."
  value = {for k, v in var.event_rules : k => oci_events_rule.these[k]}
} 