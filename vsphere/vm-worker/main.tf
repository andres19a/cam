#####################################################################
##
##      Created 8/30/18 by admin. for vm-worker
##
#####################################################################

## REFERENCE {"vsphere_network":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "vm_1_template" {
  name          = "${var.vm_1_template_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

data "vsphere_datacenter" "vm_1_datacenter" {
  name = "${var.vm_1_datacenter_name}"
}

data "vsphere_datacenter" "vm_1_datacenter_name" {
  name = "${var.vm_1_datacenter_name}"
}

data "vsphere_datastore" "vm_1_datastore" {
  name          = "${var.vm_1_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

data "vsphere_resource_pool" "CAM_cluster" {
  name          = "${var.CAM_cluster_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter_name.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_network_name}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

resource "vsphere_virtual_machine" "vm_1" {
  name          = "${var.vm_1_name}"
  datastore_id  = "${data.vsphere_datastore.vm_1_datastore.id}"
  num_cpus      = "${var.vm_1_number_of_vcpu}"
  memory = "${var.vm_1_memory}"  # Memory allocation.
  guest_id = "${data.vsphere_virtual_machine.vm_1_template.guest_id}"
  resource_pool_id = "${data.vsphere_resource_pool.CAM_cluster.id}"
  provisioner "remote-exec" {
     inline = [
        "ssh root@boot ./addworker.sh"
      ]
  }
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.vm_1_template.id}"
     customize {
      linux_options {
        host_name = "workerd"
        domain    = "gbmdemo.com"
      }

      network_interface {
        ipv4_address = "10.130.88.21"
        ipv4_netmask = "24"
      }

      ipv4_gateway = "10.130.88.1"
    }
  }
  
  disk {
    name = "${var.vm_1_disk_name}"
    size = "${var.vm_1_disk_size}"
  }
}