# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl
variable "tenancy_id" {
  type = string
}

variable "user_id" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "region" {
  type        = string
  description = "Default region"
}

variable "default_compartment_id" {
  type        = string
  description = "Default compartment OCID for event rules"
}

variable "event_rules" {
  description = "Event rules definitions"
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