resource "proxmox_virtual_environment_vm" "vm__ubuntu_22_04" {
  node_name = var.pve__node_name

  vm_id = 9022

  description = "Ubuntu Jammy 22.04"
  name        = "ubuntu-jammy"

  cpu {
    cores = 1
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 512
  }

  disk {
    import_from  = proxmox_download_file.download_file__ubuntu_22_04.id
    datastore_id = proxmox_storage_zfspool.storage_zfspool__storage.id

    size = 10

    interface = "scsi0"
    discard   = "on"

    ssd      = true
    iothread = true
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
  }

  initialization {
    datastore_id      = proxmox_storage_zfspool.storage_zfspool__storage.id
    user_data_file_id = proxmox_virtual_environment_file.vm__ubuntu_22_04__cloud_init.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  agent {
    enabled = true
  }

  template        = true
  stop_on_destroy = true
  started         = false

  depends_on = [
    proxmox_storage_zfspool.storage_zfspool__storage,
    proxmox_download_file.download_file__ubuntu_22_04,
  ]
}

resource "proxmox_cloned_vm" "vm__test" {
  node_name = var.pve__node_name
  name      = "infrastructure-test"

  clone = {
    source_vm_id = proxmox_virtual_environment_vm.vm__ubuntu_22_04.vm_id
    full         = true
  }

  cpu = {
    cores = 4
  }

  memory = {
    size = 8192
  }

  disk = {
    "scsi0" = {
      datastore_id = "local-zfs-storage"
      size_gb      = 40
    }
  }
}
