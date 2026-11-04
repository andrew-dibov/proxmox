resource "proxmox_virtual_environment_vm" "vm__test" {
  node_name = data.terraform_remote_state.remote_state__paas.outputs.pve__node_name
  name      = "infra-test"
  pool_id   = data.terraform_remote_state.remote_state__paas.outputs.paas__pool__infra_id

  clone {
    vm_id = data.terraform_remote_state.remote_state__paas.outputs.paas__template__ubuntu_2204_vm_id
    full  = true
  }

  cpu {
    cores = 4
  }

  memory {
    dedicated = 8192
  }

  disk {
    datastore_id = data.terraform_remote_state.remote_state__paas.outputs.paas__storage__storage_id
    interface    = "scsi0"
    size         = 40
  }

  network_device {
    bridge = "infra"
  }

  initialization {
    datastore_id = data.terraform_remote_state.remote_state__paas.outputs.paas__storage__storage_id

    ip_config {
      ipv4 {
        address = "10.10.0.50/24"
        gateway = "10.10.0.1"
      }
    }

    dns {
      servers = ["8.8.8.8"]
    }
  }
}
