resource "proxmox_sdn_zone_vlan" "sdn__tnnt20" {
  id = "tnnt20"
  bridge = "vmbr1"
}

resource "proxmox_sdn_vnet" "sdn__prod20" {
  id = "prod20"
  tag = 2010 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt20.id
}

resource "proxmox_sdn_subnet" "sdn__prod20" {
  vnet = proxmox_sdn_vnet.sdn__prod20.id
  cidr = "10.20.10.0/24" # 10.[tenant].[subnet].XX
}

resource "proxmox_sdn_vnet" "sdn__stage20" {
  id = "stage20"
  tag = 2020 # [tenant][subnet]
  zone = proxmox_sdn_zone_vlan.sdn__tnnt20.id
}

resource "proxmox_sdn_subnet" "sdn__stage20" {
  vnet = proxmox_sdn_vnet.sdn__stage20.id
  cidr = "10.20.20.0/24" # 10.[tenant].[subnet].XX
}