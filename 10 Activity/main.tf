provider "azurerm" {
    features {}
  
}
resource "random_id" "storage_account" {
  byte_length = 8
}
resource "azurerm_resource_group" "rg_test" {
    name = "${var.env}-${var.rg_name}-${var.rg_location}"
    location = var.rg_location
}

resource "azurerm_storage_account" "stoare_account_test" {
  name                     = "tfsta${lower(random_id.storage_account.hex)}"
  resource_group_name      = azurerm_resource_group.rg_test.name
  location                 = azurerm_resource_group.rg_test.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}