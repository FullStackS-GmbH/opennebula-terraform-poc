output "vms" {
  value = [
    for index, vm in opennebula_virtual_machine.snack_session :
    {
      name = vm.name
      ip   = vm.nic.0.computed_ip
    }
  ]
}