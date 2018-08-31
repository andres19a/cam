# Variable Definition
variable "node_count" {default = 1} # Define the number of instances

variable "Worker_connection_user" {
  type = "string"
  default = "root"
}

variable "Worker_connection_password" {
  type = "string"
}

variable "Worker_connection_host" {
  type = "string"
}

# Configure the VMware vSphere Provider. ENV Variables set for Username and Passwd.
provider "vsphere" {
 vsphere_server = "${var.Worker_connection_user}"
}

# Define the VM resource
resource "vsphere_virtual_machine" "Worker" {
 name   = "node-${format("%02d", count.index+1)}"
 folder = "vm_folder"
 vcpu   = 2
 memory = 4096
 datacenter = "DC-Softlayer"
 cluster = "SL_Cluster"

# Define the Networking settings for the VM
  connection {
    type = "ssh"
    user = "${var.Worker_connection_user}"
    password = "${var.Worker_connection_password}"
    host = "${var.Worker_connection_host}"
  }
 network_interface {
   label = "Private Network - vmnic0 vmnic2"
   ipv4_gateway = "10.130.88.1"
   ipv4_address = "10.130.88.17"
   ipv4_prefix_length = "24"
 }

# Define Domain and DNS
 domain = "domain.com"
 dns_servers = ["my_consul1", "consul2", "consul3", "8.8.8.8"]

# Define the Disks and resources. The first disk should include the template.
 disk {
   template = "Redhat7_Template"
   datastore = "Datastore01-iSCSI"
   type ="thin"
 }

 disk {
   size = "10"
   datastore = "Datastore01-iSCSI"
   type ="thin"
 }

# Define Time Zone
 time_zone = "America/New_York"

# Loop for Count
 count = "${var.node_count}"
}
