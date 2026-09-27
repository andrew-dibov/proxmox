resource "proxmox_virtual_environment_user" "user__tenants" {
  for_each = local.tenants

  user_id = "${lower(each.value.name)}@pve"
  password = random_password.password__tenants[each.key].result

  comment = each.value.comment
  enabled = true
}
