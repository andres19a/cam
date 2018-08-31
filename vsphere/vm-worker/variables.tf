#####################################################################
##
##      Created 8/30/18 by admin. for vm-worker
##
#####################################################################

variable "user" {
  type = "string"
  description = "Generated"
}

variable "password" {
  type = "string"
  description = "Generated"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
}

variable "vm_1_name" {
  type = "string"
  description = "Virtual machine name for vm_1"
}

variable "vm_1_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "vm_1_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "vm_1_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "vm_1_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "vm_1_template_name" {
  type = "string"
  description = "Generated"
}

variable "vm_1_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "vm_1_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "CAM_cluster_name" {
  type = "string"
  description = "Cluster name"
}

