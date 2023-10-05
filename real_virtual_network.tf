locals{
  network_names=["net1","net2","net3","net4","net5"]
  }


resource "azurerm_network_security_group" "ansg" {
  name                = "example-security-group"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
}

resource "azurerm_virtual_network" "avn" {
  for_each            = {for network in local.network_names:network=>network}
  name                = "${var.prefix}network-${each.key}"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.ansg.id
  }

  tags = {
    environment = "Production"
  }
}
