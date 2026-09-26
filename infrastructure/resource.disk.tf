resource "proxmox_node_disk_zfs" "disk__pool0" {
  node_name = "proxmox"
  name = "local-zfs-storage"

  raidlevel = "raidz"
  devices = [ "/dev/sda", "/dev/sdb", "/dev/sdc", "/dev/sdd" ]

  add_storage = true

  cleanup_disks = true
  cleanup_config = true
}