resource "azurerm_service_plan" "wasp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_resource_group.azure_tutorial.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "awwa" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_service_plan.wasp.location
  service_plan_id     = azurerm_service_plan.wasp.id

  site_config {}
}
