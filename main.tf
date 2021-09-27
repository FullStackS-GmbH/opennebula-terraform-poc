resource "opennebula_virtual_machine" "snack_session" {
  count       = var.vm_count
  name        = var.vm_name
  cpu         = var.vm_cpu
  vcpu        = var.vm_cpu
  memory      = var.vm_template
  template_id = data.opennebula_template.vmtemplate.id
  group       = "terraform"
  permissions = "660"

  graphics {
    type   = "VNC"
    listen = "0.0.0.0"
    keymap = "de"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  nic {
    model           = "virtio"
    network_id      = data.opennebula_virtual_network.vmnetwork.id
  }

  tags = {
    environment = "snack-session"
  }

  timeout = 5
}
