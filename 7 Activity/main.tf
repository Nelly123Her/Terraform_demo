

provider "azurerm" {
  features {}
}

module "rg" {
  source = "./modules/resource_group"
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.rg.rg_name_out
  location            = module.rg.rg_location_out
}

module "subnet" {
  source               = "./modules/subnet"
  resource_group_name  = module.rg.rg_name_out
  virtual_network_name = module.vnet.virtual_network_name_out
}

module "nic" {
  source              = "./modules/nic"
  resource_group_name = module.rg.rg_name_out
  location            = module.rg.rg_location_out
  subnet_id = module.subnet.subnet_id

}

module "vm" {
    source = "./modules/vm"
    resource_group_name = module.rg.rg_name_out
    location            = module.rg.rg_location_out
    azurerm_network_interface = module.nic.zurerm_network_interface
}