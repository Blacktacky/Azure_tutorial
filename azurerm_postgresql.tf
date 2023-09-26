resource "azurerm_postgresql_server" "aps" {
  name                = "postgresql-server-1"
  location            = "${azurerm_resource_group.azure_tutorial.location}"
  resource_group_name = "${azurerm_resource_group.azure_tutorial.name}"

  sku_name = "B_Gen5_2"

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_postgresql_database" "apd" {
  name                = "exampledb"
  resource_group_name = "${azurerm_resource_group.azure_tutorial.name}"
  server_name         = "${azurerm_postgresql_server.aps.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
