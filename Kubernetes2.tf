locals{
  cluster_names["k8batcha06","k9batcha06","k10batcha06","k11batcha06","k12batcha06"]


resource "azurerm_kubernetes_cluster" "kub2" {
  for_each            = {for cluster in local.cluster_names:cluster}
  name                = "example-aks1"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.kub2.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kub2.kube_config_raw
}
