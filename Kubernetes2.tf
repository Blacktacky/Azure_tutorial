locals{
  cluster_names=["k8batcha06","k9batcha06","k10batcha06","k11batcha06","k12batcha06"]
}
resource "azurerm_kubernetes_cluster" "kub2" {
  for_each            = {for cluster in local.cluster_names:cluster=>cluster}
  name                = "${var.prefix}cluster-${each.key}"
  location            = azurerm_resource_group.azure_tutorial.location
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = [for cluster in azurem_kubernetes_cluster.kub2: cluster.kube_config.0.client_certificate]
}

output "kube_config" {
  value = [for cluster in  azurerm_kubernetes_cluster.kub2: cluster.kube_config_raw]
}
