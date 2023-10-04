resource "azurerm_public_ip" "api" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "alb" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.api.id
  }
}
