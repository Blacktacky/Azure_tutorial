resource "azurerm_data_factory_linked_service_mysql" "dflsm" {
  name              = "example"
  data_factory_id   = azurerm_data_factory.factory1.id
  connection_string = "Server=test;Port=3306;Database=test;User=test;SSLMode=1;UseSystemTrustStore=0;Password=test"
}

resource "azurerm_data_factory_dataset_mysql" "dfdm" {
  name                = "example"
  data_factory_id     = azurerm_data_factory.factory1.id
  linked_service_name = azurerm_data_factory_linked_service_mysql.dflsm.name
}
