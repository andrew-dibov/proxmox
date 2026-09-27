resource "proxmox_sdn_zone_vlan" "sdn_zone_vlan__tenants" {
  for_each = local.tenants

  id     = lower(each.value.name)
  bridge = var.pve__linux_bridge

  depends_on = [proxmox_sdn_applier.sdn_zone_vlan__finalizer]
}

# ---

resource "proxmox_sdn_applier" "sdn_zone_vlan__finalizer" {
  on_create = false
}

resource "terraform_data" "sdn_zone_vlan__triggers" {
  triggers_replace = {
    zones = [for zone in values(proxmox_sdn_zone_vlan.sdn_zone_vlan__tenants) : zone.id]
  }
}

resource "proxmox_sdn_applier" "sdn_zone_vlan__applier" {
  on_create  = true
  on_destroy = false

  lifecycle {
    replace_triggered_by = [terraform_data.sdn_zone_vlan__triggers]
  }
  depends_on = [proxmox_sdn_zone_vlan.sdn_zone_vlan__tenants]
}
