# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {
}

resource "oci_events_rule" "these" {
  for_each       = var.event_rules
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : var.default_compartment_id
  condition      = each.value.condition
  display_name   = each.value.display_name
  is_enabled     = each.value.is_enabled

  actions {
    dynamic "actions" {
      iterator = action
      for_each = [for x in each.value.actions : {
        action_type = x.action_type
        description = x.description
        stream_id   = x.stream_id
        is_enabled  = x.is_enabled
      } if x.action_type != null && x.action_type == "OSS"]
      content {
        action_type = action.value.action_type
        description = action.value.description
        stream_id   = action.value.stream_id
        is_enabled  = action.value.is_enabled
      }
    }

    dynamic "actions" {
      iterator = action
      for_each = [for x in each.value.actions : {
        action_type = x.action_type
        description = x.description
        function_id = x.function_id
        is_enabled  = x.is_enabled
      } if x.action_type != null && x.action_type == "ONS"]
      content {
        action_type = action.value.action_type
        description = action.value.description
        topic_id    = action.value.topic_id
        is_enabled  = action.value.is_enabled
      }
    }

    dynamic "actions" {
      iterator = action
      for_each = [for x in each.value.actions : {
        action_type = x.action_type
        description = x.description
        function_id = x.function_id
        is_enabled  = x.is_enabled
      } if x.action_type != null && x.action_type == "FAAS"]
      content {
        action_type = action.value.action_type
        description = action.value.description
        function_id = action.value.function_id
        is_enabled  = action.value.is_enabled
      }
    }
  }
}