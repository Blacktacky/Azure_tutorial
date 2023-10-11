resource "azurerm_storage_account" "asqa" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.azure_tutorial.name
  location                 = azurerm_resource_group.azure_tutorial.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "asqd" {
  name                = "myexamplesqldatabase"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_resource_group.azure_tutorial.location
  server_name         = azurerm_sql_server.asqs.name

  tags = {
    environment = "production"
  }
}
