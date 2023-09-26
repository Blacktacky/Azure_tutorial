resource "azurerm_postgresql_server" "aps" {
  name                = "postgresql-server-1"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name

  sku_name = "B_Gen5_2"

  administrator_login          = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "apd" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  server_name         = azurerm_postgresql_server.aps.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
