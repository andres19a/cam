#####################################################################
##
##      Created 9/10/18 by admin. for VMAzure
##
#####################################################################

variable "subscription_id" {
  type = "string"
  description = "Generated"
}

variable "client_id" {
  type = "string"
  description = "Generated"
}

variable "client_secret" {
  type = "string"
  description = "Generated"
}

variable "tenant_id" {
  type = "string"
  description = "Generated"
}

variable "VmLinux_name" {
  type = "string"
  description = "Generated"
}

variable "vm_location" {
  type = "string"
  description = "Generated"
}

variable "vm_size" {
  type = "string"
  description = "Generated"
}

variable "VmLinux_os_profile_name" {
  type = "string"
  description = "Specifies the os profile name."
  default = "profilename"
}

variable "VmLinux_azure_user" {
  type = "string"
  description = "Generated"
}

variable "VmLinux_azure_user_password" {
  type = "string"
  description = "Generated"
}

variable "VmLinux_publisher" {
  type = "string"
  default = "Canonical"
}

variable "VmLinux_offer" {
  type = "string"
  default = "16.04.0-LTS"
}

variable "VmLinux_sku" {
  type = "string"
  default = "16.04.0-LTS"
}

variable "VmLinux_version" {
  type = "string"
  default = "latest"
}

variable "VmLinux_disable_password_authentication" {
  type = "string"
  description = "Specifies whether to disable password authentication"
  default = "false"
}

variable "VmLinux_os_disk_name" {
  type = "string"
  description = "Specifies the disk name."
  default ="osdiskname"
}

variable "VmLinux_os_disk_caching" {
  type = "string"
  description = "Specifies the caching requirements. (Ex:ReadWrite)"
  default="ReadWrite"
}

variable "VmLinux_os_disk_create_option" {
  type = "string"
  description = "Specifies how the virtual machine should be created. Possible values are Attach (managed disks only) and FromImage."
}

variable "VmLinux_os_disk_managed_disk_type" {
  type = "string"
  description = "Specifies the type of managed disk to create. Value must be either Standard_LRS or Premium_LRS. Cannot be used when vhd_uri is specified"
  default = "Standard_LRS"
}

variable "VmLinux_os_disk_delete" {
  type = "string"
  description = "Delete the OS disk automatically when deleting the VM"
  default = true
}

variable "GBM_group_name" {
  type = "string"
  description = "Resource Group Name"
  default = "GBM"
}

variable "azurerm_network_address_space" {
  type = "string"
  description = "Generated"
}

variable "location" {
  type = "string"
  description = "Generated"
}

variable "config" {
  type = "string"
  description = "Generated"
}

variable "address_prefix" {
  type = "string"
  description = "Generated"
}

