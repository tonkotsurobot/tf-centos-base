terraform {
  backend "local" {
    #path = "/mnt/nfs-drive-1/${REPO}/terraform.tfstate"
    #path = $BACKEND
  }
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  num_cpus         = 2
  memory           = 2048
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vm_name
        domain    = "home"
      }

      network_interface {
        ipv4_address = var.ip_address
        ipv4_netmask = 24
      }

      dns_server_list = ["192.168.1.20"]
      dns_suffix_list = ["home"]
      ipv4_gateway    = "192.168.1.254"
    }
  }
}
