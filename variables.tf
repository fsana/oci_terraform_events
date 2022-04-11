# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "default_compartment_id" {
  type = string
}

variable "event_rules" {
  type = map(object({
    compartment_id : string,
    condition : string,
    display_name : string,
    description : string,
    is_enabled : bool,
    actions : list(object({
      action_type : string,
      is_enabled : bool,
      description : string,
      function_id : string,
      stream_id : string,
      topic_id : string
    })),
  }))
}

