locals{
  csgo_weapons=["ak47","m4","aug","bizon"]
}

resource "azurerm_storage_account" "kubeblob" {
  for_each                 = {for cluster in local.csgo_weapons:cluster=>cluster}
  name                     = "${var.prefix}cluster-${each.key}"
  resource_group_name      = azurerm_resource_group.azure_tutorial.name
  location                 = azurerm_resource_group.azure_tutorial.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "kubeblobcon" {
  name                  = "examplestoracc"
  storage_account_name  = [for each in azurerm_storage_account.kubeblob: azurerm_storage_container.name]
  container_access_type = "private"
}

resource "azurerm_storage_blob" "kubestorblob" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.kubeblob.name
  storage_container_name = azurerm_storage_container.kubeblobcon.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
