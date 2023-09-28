resource "azurerm_availability_set" "ava" {
  name                = "acceptanceTestAvailabilitySet1"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name

  tags = {
    environment = "Production"
  }
}
