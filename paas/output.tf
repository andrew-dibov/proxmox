output "pve__endpoint" {
  value     = var.pve__endpoint
  sensitive = true
}

output "pve__node_name" {
  value     = var.pve__node_name
  sensitive = true
}

# ---

output "net__api_token" {
  value     = proxmox_user_token.user_token__net.value
  sensitive = true
}

output "net__ssh_username" {
  value     = "root"
  sensitive = true
}

output "net__ssh_private_key" {
  value     = tls_private_key.tls_private_key__net.private_key_openssh
  sensitive = true
}

output "infra__api_token" {
  value     = proxmox_user_token.user_token__infra.value
  sensitive = true
}

output "infra__ssh_username" {
  value     = "root"
  sensitive = true
}

output "infra__ssh_private_key" {
  value     = tls_private_key.tls_private_key__infra.private_key_openssh
  sensitive = true
}

# ---

output "paas__storage__storage_id" {
  value     = proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id
  sensitive = true
}

output "paas__storage__images_id" {
  value     = proxmox_storage_directory.proxmox_storage_directory__images.id
  sensitive = true
}

output "paas__storage__snippets_id" {
  value     = proxmox_storage_directory.proxmox_storage_directory__snippets.id
  sensitive = true
}


# ---

output "paas__pool__net_id" {
  value     = proxmox_virtual_environment_pool.pool__net.id
  sensitive = true
}

output "paas__pool__infra_id" {
  value     = proxmox_virtual_environment_pool.pool__infra.id
  sensitive = true
}

# ---

output "paas__template__ubuntu_2204_vm_id" {
  value     = proxmox_virtual_environment_vm.vm__ubuntu_2204_template.vm_id
  sensitive = true
}
