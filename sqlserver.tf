resource "azurerm_sql_server" "asqs" {
  for_each                     ={for server in local.sql_server_list: "${server.name}"=>server}
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
