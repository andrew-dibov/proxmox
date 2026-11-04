resource "tls_private_key" "tls_private_key__net" {
  algorithm = "ED25519"
}

resource "tls_private_key" "tls_private_key__infra" {
  algorithm = "ED25519"
}

resource "terraform_data" "tls_set_keys" {
  connection {
    type     = "ssh"
    host     = var.pve__ip
    user     = "root"
    password = var.pve__password
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/.ssh",
      "chmod 700 ~/.ssh",
      "echo '${tls_private_key.tls_private_key__net.public_key_openssh}' >> ~/.ssh/authorized_keys",
      "echo '${tls_private_key.tls_private_key__infra.public_key_openssh}' >> ~/.ssh/authorized_keys",
      "chmod 600 ~/.ssh/authorized_keys",
      "sort -u ~/.ssh/authorized_keys -o ~/.ssh/authorized_keys"
    ]
  }
}
