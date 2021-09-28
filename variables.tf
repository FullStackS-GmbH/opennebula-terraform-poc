variable "deliverables_path" {
  type        = string
  description = "Path to deliverables directory"
  default     = "./deliverables"
}

variable "one_endpoint" {
    type = string
    description = "URL of OpenNebula XMLRPC API"
}

variable "one_username" {
    type = string
    description = "OpenNebula Username"
    sensitive = true
}

variable "one_password" {
    type = string
    description = "OpenNebula User Password"
    sensitive = true
}

variable "vm_cpu" {
    type = number
    description = "Count of VM CPU Cores"
    default = 2
}

variable "vm_ram" {
    type = number
    description = "MB of VM RAM"
    default = 3192
}

variable "vm_name" {
    type = string
    description = "Name Prefix of VM"
}

variable "vm_template" {
    type = string
    description = "Name of OpenNebula VM Template"  
}

variable "vm_network" {
    type = string
    description = "Name of OpenNebula VNet"
  
}

variable "vm_count" {
    type = number
    description = "Count of VMs"
    default = 1
  
}