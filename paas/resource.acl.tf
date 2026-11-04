resource "proxmox_acl" "acl__net_user__storage__storage" {
  path = "/storage/${proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id}"

  role_id = proxmox_virtual_environment_role.role__net.role_id
  user_id = proxmox_virtual_environment_user.user__net.user_id

  propagate = true
}

resource "proxmox_acl" "acl__net_token__storage__storage" {
  path = "/storage/${proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id}"

  role_id  = proxmox_virtual_environment_role.role__net.role_id
  token_id = proxmox_user_token.user_token__net.id

  propagate = true
}

resource "proxmox_acl" "acl__net_user__storage__images" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__images.id}"

  role_id = proxmox_virtual_environment_role.role__net.role_id
  user_id = proxmox_virtual_environment_user.user__net.user_id

  propagate = true
}

resource "proxmox_acl" "acl__net_token__storage__images" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__images.id}"

  role_id  = proxmox_virtual_environment_role.role__net.role_id
  token_id = proxmox_user_token.user_token__net.id

  propagate = true
}

resource "proxmox_acl" "acl__net_user__storage__snippets" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__snippets.id}"

  role_id = proxmox_virtual_environment_role.role__net.role_id
  user_id = proxmox_virtual_environment_user.user__net.user_id

  propagate = true
}

resource "proxmox_acl" "acl__net_token__storage__snippets" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__snippets.id}"

  role_id  = proxmox_virtual_environment_role.role__net.role_id
  token_id = proxmox_user_token.user_token__net.id

  propagate = true
}

resource "proxmox_acl" "acl__net_user__sdn" {
  path = "/sdn"

  role_id = proxmox_virtual_environment_role.role__net.role_id
  user_id = proxmox_virtual_environment_user.user__net.user_id

  propagate = true
}

resource "proxmox_acl" "acl__net_token__sdn" {
  path = "/sdn"

  role_id  = proxmox_virtual_environment_role.role__net.role_id
  token_id = proxmox_user_token.user_token__net.id

  propagate = true
}

# resource "proxmox_acl" "acl__net_user__sdn__vmbr0" {
#   path    = "/sdn/zones/localnetwork/vmbr0"
#   role_id = proxmox_virtual_environment_role.role__net.role_id
#   user_id = proxmox_virtual_environment_user.user__net.user_id
#   propagate = true
# }

# resource "proxmox_acl" "acl__net_token__sdn__vmbr0" {
#   path    = "/sdn/zones/localnetwork/vmbr0"
#   role_id = proxmox_virtual_environment_role.role__net.role_id
#   token_id = proxmox_user_token.user_token__net.id
#   propagate = true
# }

resource "proxmox_acl" "acl__net_user__pool__net" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__net.pool_id}"

  role_id = proxmox_virtual_environment_role.role__net.role_id
  user_id = proxmox_virtual_environment_user.user__net.user_id

  propagate = true
}

resource "proxmox_acl" "acl__net_token__pool__net" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__net.pool_id}"

  role_id  = proxmox_virtual_environment_role.role__net.role_id
  token_id = proxmox_user_token.user_token__net.id

  propagate = true
}

resource "proxmox_acl" "acl__net_user__vms" {
  path = "/vms"

  role_id = proxmox_virtual_environment_role.role__net.role_id
  user_id = proxmox_virtual_environment_user.user__net.user_id

  propagate = true
}

resource "proxmox_acl" "acl__net_token__vms" {
  path = "/vms"

  role_id  = proxmox_virtual_environment_role.role__net.role_id
  token_id = proxmox_user_token.user_token__net.id

  propagate = true
}


# ---

resource "proxmox_acl" "acl__infra_user__storage__storage" {
  path = "/storage/${proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id}"

  role_id = proxmox_virtual_environment_role.role__infra.role_id
  user_id = proxmox_virtual_environment_user.user__infra.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infra_token__storage__storage" {
  path = "/storage/${proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id}"

  role_id  = proxmox_virtual_environment_role.role__infra.role_id
  token_id = proxmox_user_token.user_token__infra.id

  propagate = true
}

resource "proxmox_acl" "acl__infra_user__storage__images" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__images.id}"

  role_id = proxmox_virtual_environment_role.role__infra.role_id
  user_id = proxmox_virtual_environment_user.user__infra.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infra_token__storage__images" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__images.id}"

  role_id  = proxmox_virtual_environment_role.role__infra.role_id
  token_id = proxmox_user_token.user_token__infra.id

  propagate = true
}

resource "proxmox_acl" "acl__infra_user__storage__snippets" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__snippets.id}"

  role_id = proxmox_virtual_environment_role.role__infra.role_id
  user_id = proxmox_virtual_environment_user.user__infra.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infra_token__storage__snippets" {
  path = "/storage/${proxmox_storage_directory.proxmox_storage_directory__snippets.id}"

  role_id  = proxmox_virtual_environment_role.role__infra.role_id
  token_id = proxmox_user_token.user_token__infra.id

  propagate = true
}

resource "proxmox_acl" "acl__infra_user__sdn__zones__platform" {
  path = "/sdn/zones/platform"

  role_id = proxmox_virtual_environment_role.role__infra.role_id
  user_id = proxmox_virtual_environment_user.user__infra.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infra_token__sdn__zones__platform" {
  path = "/sdn/zones/platform"

  role_id  = proxmox_virtual_environment_role.role__infra.role_id
  token_id = proxmox_user_token.user_token__infra.id

  propagate = true
}

resource "proxmox_acl" "acl__infra_user__pool__infra" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__infra.pool_id}"

  role_id = proxmox_virtual_environment_role.role__infra.role_id
  user_id = proxmox_virtual_environment_user.user__infra.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infra_token__pool__infra" {
  path = "/pool/${proxmox_virtual_environment_pool.pool__infra.pool_id}"

  role_id  = proxmox_virtual_environment_role.role__infra.role_id
  token_id = proxmox_user_token.user_token__infra.id

  propagate = true
}

resource "proxmox_acl" "acl__infra_user__vms" {
  path = "/vms"

  role_id = proxmox_virtual_environment_role.role__infra.role_id
  user_id = proxmox_virtual_environment_user.user__infra.user_id

  propagate = true
}

resource "proxmox_acl" "acl__infra_token__vms" {
  path = "/vms"

  role_id  = proxmox_virtual_environment_role.role__infra.role_id
  token_id = proxmox_user_token.user_token__infra.id

  propagate = true
}
