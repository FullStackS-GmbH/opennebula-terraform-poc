terraform {
  required_providers {
    opennebula = {
      source  = "OpenNebula/opennebula"
      version = "0.3.0"
    }
  }
}

provider "opennebula" {
  endpoint = var.one_endpoint
  username = var.one_username
  password = var.one_password
}