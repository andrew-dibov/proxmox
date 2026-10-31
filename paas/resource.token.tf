variable "user_token__infrastructure__token_name" {
  type    = string
  default = "token-infrastructure"
}

variable "user_token__network__token_name" {
  type    = string
  default = "token-network"
}

# ---

resource "proxmox_user_token" "user_token__infrastructure" {
  user_id    = proxmox_virtual_environment_user.user__infrastructure.user_id
  token_name = var.user_token__infrastructure__token_name

  privileges_separation = true
}

resource "proxmox_user_token" "user_token__network" {
  user_id    = proxmox_virtual_environment_user.user__network.user_id
  token_name = var.user_token__network__token_name

  privileges_separation = true
}
