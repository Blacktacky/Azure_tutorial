resource "azurerm_data_factory_linked_service_mysql" "dflsm" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  data_factory_name   = azurerm_data_factory.factory1.name
  connection_string   = "Server=test;Port=3306;Database=test;User=test;SSLMode=1;UseSystemTrustStore=0;Password=test"
}

resource "azurerm_data_factory_dataset_mysql" "dfdm" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  data_factory_name   = azurerm_data_factory.factory1.name
  linked_service_name = azurerm_data_factory_linked_service_mysql.dflsm.name
}
