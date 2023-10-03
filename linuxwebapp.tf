provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "lasp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_resource_group.azure_tutorial.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "alwa" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_service_plan.lasp.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}
