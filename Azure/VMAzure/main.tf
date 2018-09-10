#####################################################################
##
##      Created 9/10/18 by admin. for VMAzure
##
#####################################################################

## REFERENCE {"azure_network":{"type": "azurerm_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  version = "~> 1.1"
}


data "azurerm_subnet" "newvm814" {
  name                 = "newvm814"
  virtual_network_name = "${.name}"
  address_prefix       = "${var.address_prefix}"
}

resource "azurerm_virtual_machine" "VmLinux" {
  name                  = "${var.VmLinux_name}"
  location              = "${var.vm_location}"
  vm_size               = "${var.vm_size}"
  resource_group_name   = "${var.GBM_group_name}"
  network_interface_ids = ["${azurerm_network_interface.interface.id}"]
  tags {
    Name = "${var.VmLinux_name}"
  }
  os_profile {
    computer_name  = "${var.VmLinux_os_profile_name}"
    admin_username = "${var.VmLinux_azure_user}"
    admin_password = "${var.VmLinux_azure_user_password}"
  }
  storage_image_reference {
    publisher = "${var.VmLinux_publisher}"
    offer     = "${var.VmLinux_offer}"
    sku       = "${var.VmLinux_sku}"
    version   = "${var.VmLinux_version}"
  }
  os_profile_linux_config {
    disable_password_authentication = "${var.VmLinux_disable_password_authentication}"
  }
  storage_os_disk {
    name              = "${var.VmLinux_os_disk_name}"
    caching           = "${var.VmLinux_os_disk_caching}"
    create_option     = "${var.VmLinux_os_disk_create_option}"
    managed_disk_type = "${var.VmLinux_os_disk_managed_disk_type}"
  }
  delete_os_disk_on_termination = "${var.VmLinux_os_disk_delete}"
}

resource "azurerm_network_interface" "interface" {
  name                = "interface"
  location            = "${var.vm_location}"
  resource_group_name = "${var.GBM_group_name}"
  ip_configuration {
    name                          = "${var.config}"
    private_ip_address_allocation = "Static"
    subnet_id  = "${data.azurerm_subnet.newvm814.id}"
  }
}