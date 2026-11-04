data "terraform_remote_state" "remote_state__paas" {
  backend = "local"
  config = {
    path = "${path.module}/../paas/terraform.tfstate"
  }
}

# ---

terraform {
  required_version = ">= 1.16.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.114.0"
    }
  }
}

provider "proxmox" {
  endpoint  = data.terraform_remote_state.remote_state__paas.outputs.pve__endpoint
  api_token = data.terraform_remote_state.remote_state__paas.outputs.net__api_token

  insecure = true

  ssh {
    username    = data.terraform_remote_state.remote_state__paas.outputs.net__ssh_username
    private_key = data.terraform_remote_state.remote_state__paas.outputs.net__ssh_private_key
  }
}
