resource "proxmox_network_linux_bond" "net__bond0" {
  node_name = "proxmox"

  name   = "bond0"
  slaves = ["nic0", "nic2"]

  bond_mode    = "active-backup"
  bond_primary = "nic0"

  depends_on = [proxmox_network_applier.net__finalizer]
}

resource "proxmox_network_linux_bridge" "net__vmbr0" {
  node_name = "proxmox"

  name  = "vmbr0"
  vlan_aware = true
  ports = [proxmox_network_linux_bond.net__bond0.name]

  depends_on = [proxmox_network_applier.net__finalizer]
}

# --- --- ---

resource "proxmox_network_applier" "net__finalizer" {
  node_name = "proxmox"
  on_create = false
}

resource "proxmox_network_applier" "net__applier" {
  node_name  = "proxmox"
  on_destroy = false

  lifecycle {
    replace_triggered_by = [
      proxmox_network_linux_bond.net__bond0,
      proxmox_network_linux_bridge.net__vmbr0,
    ]
  }

  depends_on = [
    proxmox_network_linux_bond.net__bond0,
    proxmox_network_linux_bridge.net__vmbr0,
  ]
}
