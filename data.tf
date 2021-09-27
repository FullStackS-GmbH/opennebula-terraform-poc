data "opennebula_virtual_network" "vmnetwork" {
    name = var.vm_network  
}

data "opennebula_template" "vmtemplate" {
    name = var.vm_template
}