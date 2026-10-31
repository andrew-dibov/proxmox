resource "proxmox_acl" "acl__infrastructure_user" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__infrastructure.pool_id}"

  role_id = proxmox_virtual_environment_role.role__infrastructure.role_id
  user_id = proxmox_virtual_environment_user.user__infrastructure.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infrastructure_token" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__infrastructure.pool_id}"

  role_id  = proxmox_virtual_environment_role.role__infrastructure.role_id
  token_id = proxmox_user_token.user_token__infrastructure.id

  propagate = true
}

# ---

resource "proxmox_acl" "acl__network_user" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__network.pool_id}"

  role_id = proxmox_virtual_environment_role.role__network.role_id
  user_id = proxmox_virtual_environment_user.user__network.user_id

  propagate = true
}

resource "proxmox_acl" "acl__network_token" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__network.pool_id}"

  role_id  = proxmox_virtual_environment_role.role__network.role_id
  token_id = proxmox_user_token.user_token__network.id

  propagate = true
}
