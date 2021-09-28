output "vms" {
  value = [
    for index, vm in opennebual_virtual_machine.snack_session :
    {
      name = vm.name
      ip   = opennebual_virtual_machine.snack_session[index].computed_ip
    }
  ]
}
