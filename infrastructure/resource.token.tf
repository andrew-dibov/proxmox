variable "user_token__tenants_token_name" {
  type = string
  default = "terraform"
}

resource "proxmox_user_token" "user_token__tenants" {
  for_each = local.tenants

  user_id = proxmox_virtual_environment_user.user__tenants[each.key].user_id
  token_name = var.user_token__tenants_token_name
  privileges_separation = false
}