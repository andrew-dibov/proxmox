resource "proxmox_virtual_environment_vm" "vm__vpn_gateway" {
  node_name = data.terraform_remote_state.remote_state__paas.outputs.pve__node_name

  clone {
    vm_id = data.terraform_remote_state.remote_state__paas.outputs.paas__template__ubuntu_2204_vm_id
    full  = true
  }

  name    = "vpn-gateway"
  pool_id = data.terraform_remote_state.remote_state__paas.outputs.paas__pool__net_id

  description = "VPN Gateway"
  tags        = ["vm", "ubuntu", "jammy", "net", "vpn", "gateway"]

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  network_device {
    bridge = proxmox_sdn_vnet.sdn_vnet__net.id
    model  = "virtio"
  }

  initialization {
    datastore_id      = data.terraform_remote_state.remote_state__paas.outputs.paas__storage__storage_id
    user_data_file_id = proxmox_virtual_environment_file.vm__vpn_gateway__cloud_init.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    ip_config {
      ipv4 {
        address = "10.0.0.10/24"
        gateway = "10.0.0.1"
      }
    }
  }

  depends_on = [
    proxmox_sdn_applier.sdn_applier,
    proxmox_virtual_environment_file.vm__vpn_gateway__cloud_init,
  ]
}
