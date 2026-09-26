resource "proxmox_sdn_zone_vlan" "sdn__tnnt10" {
  id = "tnnt10"
  bridge = "vmbr1"
}

resource "proxmox_sdn_vnet" "sdn__prod10" {
  id = "prod10"
  tag = 1010 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt10.id
}

resource "proxmox_sdn_subnet" "sdn__prod10" {
  vnet = proxmox_sdn_vnet.sdn__prod10.id
  cidr = "10.10.10.0/24" # 10.[tenant].[subnet].XX
}

resource "proxmox_sdn_vnet" "sdn__stage10" {
  id = "stage10"
  tag = 1020 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt10.id
}

resource "proxmox_sdn_subnet" "sdn__stage10" {
  vnet = proxmox_sdn_vnet.sdn__stage10.id
  cidr = "10.10.20.0/24" # 10.[tenant].[subnet].XX
}