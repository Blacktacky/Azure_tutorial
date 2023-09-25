resource "azurerm_resource_group""azure_tutorial"{
    name="${var.prefix}_Resource_Group_${var.env}"
    location="Canada Central"
}
resource "azurerm_storage_account" "awp" {
  name                     = "${var.prefix}storage-${var.env}"
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
}

resource "azurerm_storage_blob" "blob_tutorial" {
  name                   = "${var.prefix}_blob_${var.env}"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}

resource "azurerm_kubernetes_cluster" "kuburnetes_tutorial" {
  name                = "${var.prefix}_kubernetes_cluster_${var.env}"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  dns_prefix          = "montreal_kubernetes"

  default_node_pool {
    name       = var.node_pool
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = var.system
  }

  tags = {
    Environment = var.environment
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.kuburnetes_tutorial.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value =  azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
