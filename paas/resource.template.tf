resource "proxmox_virtual_environment_vm" "vm__ubuntu_2204_template" {
  node_name = var.pve__node_name

  vm_id = 9000
  name  = "${local.ubuntu_2204__prefix}-template"

  description = "Ubuntu 22.04 template"
  tags        = ["template", "ubuntu", "jammy"]

  bios    = "ovmf"
  machine = "q35"

  cpu {
    type    = "x86-64-v2-AES"
    sockets = 1
    cores   = 1
    limit   = 0
    numa    = false
  }

  memory {
    dedicated = 512
    floating  = 512
  }

  disk {
    datastore_id = proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id
    import_from  = proxmox_download_file.download_file__ubuntu_2204.id

    interface = "scsi0"
    size      = 10

    file_format = "raw"
    discard     = "on"

    ssd      = true
    iothread = true
  }

  efi_disk {
    datastore_id = proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id

    file_format = "raw"
    type        = "4m"
  }

  # network_device {
  #   model    = "virtio"
  #   bridge   = "vmbr0"
  #   firewall = false
  #   mtu      = 0
  # }

  initialization {
    datastore_id      = proxmox_storage_zfspool.proxmox_storage_zfspool__storage.id
    user_data_file_id = proxmox_virtual_environment_file.vm__ubuntu_2204__cloud_init.id
  }

  agent {
    enabled = true
    trim    = true
    timeout = "5m"
  }

  serial_device {}

  template        = true
  stop_on_destroy = true
  started         = false
  on_boot         = false

  depends_on = [
    proxmox_storage_zfspool.proxmox_storage_zfspool__storage,
    proxmox_download_file.download_file__ubuntu_2204,
  ]
}
