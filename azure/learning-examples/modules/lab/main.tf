resource "azurerm_resource_group" "lab" {
  name     = "${local.prefix}-rg"
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "lab" {
  name                = "${local.prefix}-vnet"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  address_space       = [var.network_cidr]
  tags                = local.tags
}

resource "azurerm_subnet" "lab" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.lab.name
  address_prefixes     = [each.value]
}

moved {
  from = azurerm_network_interface.vm
  to   = azurerm_network_interface.lab
}

resource "azurerm_network_interface" "lab" {
  count = var.enable_nic ? 1 : 0

  name                = "${local.prefix}-nic"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  tags                = local.tags

  ip_configuration {
    name                          = "private"
    subnet_id                     = azurerm_subnet.lab["app"].id
    private_ip_address_allocation = "Dynamic"
  }
}
