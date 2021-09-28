output "vms" {
  value = [
    for index, vm in opennebula_virtual_machine.snack_session :
    {
      name = vm.name
      ip   = opennebula_virtual_machine.snack_session[index].computed_ip
    }
  ]
}
