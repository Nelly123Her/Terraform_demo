provider "azurerm" {
  features {}
}

resource "random_string" "string_random" {
  length  = 6
  upper   = false
  special = false

}
locals {
  environment          = terraform.workspace
  owners               = var.business_division
  resource_name_prefix = "${var.business_division}-${terraform.workspace}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name_prefix}-${var.rg_name}"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.resource_name_prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.address_space_vnet]
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "${local.resource_name_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${local.resource_name_prefix}-public_ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"



}