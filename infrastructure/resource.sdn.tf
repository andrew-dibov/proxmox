resource "proxmox_sdn_zone_vlan" "sdn__tnnt10" {
  id     = "tnnt10"
  bridge = proxmox_network_linux_bridge.net__vmbr0.name

  depends_on = [proxmox_sdn_applier.sdn__finalizer]
}

resource "proxmox_sdn_vnet" "sdn__prod10" {
  id   = "prod10"
  tag  = 1010 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt10.id
}

resource "proxmox_sdn_subnet" "sdn__prod10" {
  vnet = proxmox_sdn_vnet.sdn__prod10.id
  cidr = "10.10.10.0/24" # 10.[tenant].[subnet].XX
}

resource "proxmox_sdn_vnet" "sdn__stage10" {
  id   = "stage10"
  tag  = 1020 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt10.id
}

resource "proxmox_sdn_subnet" "sdn__stage10" {
  vnet = proxmox_sdn_vnet.sdn__stage10.id
  cidr = "10.10.20.0/24" # 10.[tenant].[subnet].XX
}

# --- --- ---

resource "proxmox_sdn_zone_vlan" "sdn__tnnt20" {
  id     = "tnnt20"
  bridge = proxmox_network_linux_bridge.net__vmbr0.name

  depends_on = [proxmox_sdn_applier.sdn__finalizer]
}

resource "proxmox_sdn_vnet" "sdn__prod20" {
  id   = "prod20"
  tag  = 2010 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt20.id
}

resource "proxmox_sdn_subnet" "sdn__prod20" {
  vnet = proxmox_sdn_vnet.sdn__prod20.id
  cidr = "10.20.10.0/24" # 10.[tenant].[subnet].XX
}

resource "proxmox_sdn_vnet" "sdn__stage20" {
  id   = "stage20"
  tag  = 2020 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt20.id
}

resource "proxmox_sdn_subnet" "sdn__stage20" {
  vnet = proxmox_sdn_vnet.sdn__stage20.id
  cidr = "10.20.20.0/24" # 10.[tenant].[subnet].XX
}

# --- --- ---

resource "proxmox_sdn_applier" "sdn__finalizer" {
  on_create = false
}

resource "proxmox_sdn_applier" "sdn__applier" {
  lifecycle {
    replace_triggered_by = [
      proxmox_sdn_zone_vlan.sdn__tnnt10,
      proxmox_sdn_vnet.sdn__prod10,
      proxmox_sdn_subnet.sdn__prod10,
      proxmox_sdn_vnet.sdn__stage10,
      proxmox_sdn_subnet.sdn__stage10,

      proxmox_sdn_zone_vlan.sdn__tnnt20,
      proxmox_sdn_vnet.sdn__prod20,
      proxmox_sdn_subnet.sdn__prod20,
      proxmox_sdn_vnet.sdn__stage20,
      proxmox_sdn_subnet.sdn__stage20,
    ]
  }

  depends_on = [
    proxmox_sdn_zone_vlan.sdn__tnnt10,
    proxmox_sdn_vnet.sdn__prod10,
    proxmox_sdn_subnet.sdn__prod10,
    proxmox_sdn_vnet.sdn__stage10,
    proxmox_sdn_subnet.sdn__stage10,

    proxmox_sdn_zone_vlan.sdn__tnnt20,
    proxmox_sdn_vnet.sdn__prod20,
    proxmox_sdn_subnet.sdn__prod20,
    proxmox_sdn_vnet.sdn__stage20,
    proxmox_sdn_subnet.sdn__stage20,
  ]
}

