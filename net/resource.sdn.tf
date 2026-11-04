variable "sdn_zone_simple__zone__id" {
  type    = string
  default = "platform"
}

resource "proxmox_sdn_zone_simple" "sdn_zone_simple__zone" {
  nodes = [data.terraform_remote_state.remote_state__paas.outputs.pve__node_name]

  id  = var.sdn_zone_simple__zone__id
  mtu = 1500
}

# ---

variable "sdn_vnet__net__id" {
  type    = string
  default = "net"
}

resource "proxmox_sdn_vnet" "sdn_vnet__net" {
  zone = proxmox_sdn_zone_simple.sdn_zone_simple__zone.id
  id   = var.sdn_vnet__net__id
}

variable "sdn_vnet__infra__id" {
  type    = string
  default = "infra"
}

resource "proxmox_sdn_vnet" "sdn_vnet__infra" {
  zone = proxmox_sdn_zone_simple.sdn_zone_simple__zone.id
  id   = var.sdn_vnet__infra__id
}

# ---

variable "sdn_subnet__net__cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "sdn_subnet__net__gateway" {
  type    = string
  default = "10.0.0.1"
}

resource "proxmox_sdn_subnet" "sdn_subnet__net" {
  vnet = proxmox_sdn_vnet.sdn_vnet__net.id

  cidr    = var.sdn_subnet__net__cidr
  gateway = var.sdn_subnet__net__gateway

  snat = true
}

variable "sdn_subnet__infra__cidr" {
  type    = string
  default = "10.10.0.0/24"
}

variable "sdn_subnet__infra__gateway" {
  type    = string
  default = "10.10.0.1"
}

resource "proxmox_sdn_subnet" "sdn_subnet__infra" {
  vnet = proxmox_sdn_vnet.sdn_vnet__infra.id

  cidr    = var.sdn_subnet__infra__cidr
  gateway = var.sdn_subnet__infra__gateway

  snat = true
}

# ---

resource "proxmox_sdn_applier" "sdn_applier" {
  lifecycle {
    replace_triggered_by = [
      proxmox_sdn_zone_simple.sdn_zone_simple__zone,
      proxmox_sdn_vnet.sdn_vnet__net,
      proxmox_sdn_subnet.sdn_subnet__net,
      proxmox_sdn_vnet.sdn_vnet__infra,
      proxmox_sdn_subnet.sdn_subnet__infra,
    ]
  }

  depends_on = [
    proxmox_sdn_zone_simple.sdn_zone_simple__zone,
    proxmox_sdn_vnet.sdn_vnet__net,
    proxmox_sdn_subnet.sdn_subnet__net,
    proxmox_sdn_vnet.sdn_vnet__infra,
    proxmox_sdn_subnet.sdn_subnet__infra,
  ]
}
