resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}


resource "azurerm_resource_group" "rg_sp" {
  name     = "myTFResourceGroupSP"
  location = "westus2"
}


# resource "azurerm_resource_group" "rg_sp_2" {
#   name     = "myTFResourceGroupSP2"
#   location = "westus2"
# }

resource "azurerm_resource_group" "existing" {
  name     = "existing-rg-changed"
  location = "westus2"
}

variable "resource_group_name" {
  default = "myResourceGroupABC"
}


resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = "westus2"

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.myrg.name
}