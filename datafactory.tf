resource "azurerm_data_factory" "factory1" {
  name                = "example"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
}
