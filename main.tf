resource "azurerm_resource_group""azure_tutorial"{
    name="${var.prefix}_Resource_Group_${var.env}"
    location="Canada Central"
}
resource "azurerm_storage_account" "awp" {
  name                     = "${var.prefix}storageaccountname-${var.env}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
