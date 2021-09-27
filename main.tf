resource "opennebula_virtual_machine" "snack_session" {
  count       = var.vm_count
  name        = var.vm_name
  cpu         = var.vm_cpu
  vcpu        = var.vm_cpu
  memory      = var.vm_template
  group       = "terraform"
  permissions = "660"

  context {
    NETWORK      = "YES"
    HOSTNAME     = "$NAME"
    START_SCRIPT = "apt install nginx"
  }

  graphics {
    type   = "VNC"
    listen = "0.0.0.0"
    keymap = "de"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  disk {
    image_id = opennebula_image.osimage.id
    size     = 10000
    target   = "vda"
    driver   = "qcow2"
  }

  nic {
    model           = "virtio"
    network_id      = var.vnetid
  }

  tags = {
    environment = "snack-session"
  }

  timeout = 5
}
