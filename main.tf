resource "azurerm_resource_group""azure_tutorial"{
    name="${var.prefix}_Resource_Group_${var.env}"
    location="Canada Central"
}
resource "azurerm_storage_account" "awp" {
  name                     = "${var.prefix}str${var.env}"
  resource_group_name      = azurerm_resource_group.azure_tutorial.name
  location                 = azurerm_resource_group.azure_tutorial.location
  account_tier             = var.account_tier
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storecont" {
  name                  = "${var.prefix}cont${var.env}"
  storage_account_name  = azurerm_storage_account.awp.name
  container_access_type = var.access_type
}

resource "azurerm_storage_blob" "blobstorage" {
  name                   = "${var.prefix}blob${var.env}"
  storage_account_name   = azurerm_storage_account.awp.name
  storage_container_name = azurerm_storage_container.storecont.name
  type                   = var.storage_type
  source                 = var.storage_source
}
