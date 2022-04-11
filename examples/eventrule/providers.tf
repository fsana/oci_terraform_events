# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

terraform {
  required_version = ">= 0.12.6"
  required_providers {
    oci = {
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}