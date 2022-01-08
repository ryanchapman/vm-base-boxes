packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.5"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "ubuntu-focal" {
  iso_url = "https://cdimage.ubuntu.com/releases/20.04/release/ubuntu-20.04.3-live-server-arm64.iso"
  iso_checksum = "md5:679870a4e76a34a7438689cd7ebccf49"
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_timeout = "30m"
  shutdown_command = "sudo shutdown -h now"
  guest_os_type = "arm-ubuntu-64"
  disk_adapter_type = "nvme"
  version = 19
  http_directory = "http"
  boot_command = [
        "c",
        "linux /casper/vmlinuz \"ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\" --- autoinstall",
        "<enter>",
        "initrd /casper/initrd",
        "<enter>",
        "boot",
        "<enter><wait>"
  ]
  usb = true
  memory = 2048
  cpus = 2
  disk_size = 40000
  vm_name = "Ubuntu Server 20.04"
  output_directory = "output"
}

build {
  sources = ["sources.vmware-iso.ubuntu-focal"]

  provisioner "shell" {
    scripts = [
      "add-key.sh",
      "vmware-cleanup.sh"
    ]
  }
}