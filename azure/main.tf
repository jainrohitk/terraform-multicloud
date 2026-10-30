resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}


resource "azurerm_resource_group" "rg_sp" {
  name     = "myTFResourceGroupSP"
  location = "westus2"
}


resource "azurerm_resource_group" "rg_sp_2" {
  name     = "myTFResourceGroupSP2"
  location = "westus2"
}

resource "azurerm_resource_group" "existing" {
  name     = "existing-rg-changed"
  location = "westus2"
}