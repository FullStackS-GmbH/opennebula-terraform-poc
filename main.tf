resource "tls_private_key" "key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "opennebula_virtual_machine" "snack_session" {
  count       = var.vm_count
  name        = format("${var.vm_name}-%02d", count.index + 1)
  cpu         = var.vm_cpu
  vcpu        = var.vm_cpu
  memory      = var.vm_ram
  template_id = data.opennebula_template.vmtemplate.id
  group       = "oneadmin"
  permissions = "660"

  context = {
    HOSTNAME       = "$NAME"
    USERNAME       = "ubuntu"
    START_SCRIPT_BASE64 = "YXB0IGluc3RhbGwgbmdpbngKZWNobyAiSGVsbG8gcGVnYXN1cyBOZXh0R2VuIENsb3VkIiA+IC92YXIvd3d3L2h0bWwvaW5kZXguaHRtbCA="
    SSH_PUBLIC_KEY = tls_private_key.key.public_key_openssh
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

  nic {
    model      = "virtio"
    network_id = data.opennebula_virtual_network.vmnetwork.id
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "uname -a",
  #   ]

  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = tls_private_key.key.private_key_pem
  #     host        = self.nic.0.computed_ip
  #   }
  # }

}

resource "local_file" "ssh_private_key" {
  filename        = format("${var.deliverables_path}/id_rsa")
  content         = tls_private_key.key.private_key_pem
  file_permission = "600"
}

resource "local_file" "ssh_public_key" {
  filename        = format("${var.deliverables_path}/id_rsa.pub")
  content         = tls_private_key.key.public_key_openssh
  file_permission = "644"
}

