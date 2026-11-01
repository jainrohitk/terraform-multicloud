removed {
  from = azurerm_resource_group.rg_sp_2  # Remove from state file without destroying the resource in cloud

  lifecycle {
    destroy = false
  }
}