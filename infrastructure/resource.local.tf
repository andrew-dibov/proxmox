resource "local_file" "file__tenants" {
  for_each = local.tenants

  filename = "${path.module}/output/${each.key}.env"
  file_permission = "0600"
  
  content = <<-EOT
    PVE_USER="${lower(each.value.name)}@pve"
    PVE_PASSWORD=${random_password.password__tenants[each.key].result}
    PROXMOX_ENDPOINT=${var.pve__endpoint}
    PROXMOX_API_TOKEN=${proxmox_user_token.user_token__tenants[each.key].value}
  EOT
}