output "pve__node_name" {
  value = var.pve__node_name
}

output "storage__id" {
  value = var.storage_zfspool__storage__id
}

# ---

output "infrastructure__token_id" {
  value     = proxmox_user_token.user_token__infrastructure.id
  sensitive = true
}

output "infrastructure__token_secret" {
  value     = proxmox_user_token.user_token__infrastructure.value
  sensitive = true
}

# ---

output "network__token_id" {
  value     = proxmox_user_token.user_token__network.id
  sensitive = true
}

output "network__token_secret" {
  value     = proxmox_user_token.user_token__network.value
  sensitive = true
}

# ---
