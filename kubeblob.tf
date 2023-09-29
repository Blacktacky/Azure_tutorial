locals{
  csgo_weapons=["ak47","m4","aug","bizon"]
}

resource "azurerm_storage_account" "kubeblob" {
  name                     = ""examplestoracc""
  resource_group_name      = azurerm_resource_group.azure_tutorial.name
  location                 = azurerm_resource_group.azure_tutorial.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "kubeblobcon" {
  name                  = "examplestoracc"
  storage_account_name  = azurerm_storage_account.kube.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "kubestorblob" {
  for_each               = {for csgo in local.csgo_weapons:csgo=>csgo}
  name                   = "${var.prefix}csgo-${each.key}"
  storage_account_name   = azurerm_storage_account.kubeblob.name
  storage_container_name = azurerm_storage_container.kubeblobcon.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
