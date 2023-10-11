resource "azurerm_sql_server" "asqs" {
  name                         = "myexamplesqlserver"
  resource_group_name          = azurerm_resource_group.azure_tutorial.name
  location                     = azurerm_resource_group.azure_tutorial.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = {
    environment = "production"
  }
}

4dm1n157r470r
4-v3ry-53cr37-p455w0rd
