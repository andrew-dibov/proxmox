resource "proxmox_acl" "acl__tenant_sdn_zones" {
  for_each = local.tenants

  path      = "/sdn/zones/${lower(each.value.name)}"
  role_id   = proxmox_virtual_environment_role.role__tenant.role_id
  user_id   = proxmox_virtual_environment_user.user__tenants[each.key].user_id
  propagate = true
}

resource "proxmox_acl" "acl__tenant_vms" {
  for_each = local.tenants

  path      = "/vms"
  role_id   = proxmox_virtual_environment_role.role__tenant.role_id
  user_id   = proxmox_virtual_environment_user.user__tenants[each.key].user_id
  propagate = true
}

resource "proxmox_acl" "acl__tenant_storage" {
  for_each = local.tenants

  path      = "/storage/${var.storage_zfspool__storage0_id}"
  role_id   = proxmox_virtual_environment_role.role__tenant.role_id
  user_id   = proxmox_virtual_environment_user.user__tenants[each.key].user_id
  propagate = false
}
