resource "azurerm_kubernetes_cluster_node_pool" "kube_pool" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.kube1.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
}
