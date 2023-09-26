resource "azurerm_resource_group" "azure_tutorial" {
  name     = "api-rg-pro"
  location = ""
}

resource "azurerm_postgresql_server" "example" {
  name                = "postgresql-server-1"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"

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

resource "azurerm_postgresql_database" "example" {
  name                = "exampledb"
  resource_group_name = "${azurerm_resource_group.example.name}"
  server_name         = "${azurerm_postgresql_server.example.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
