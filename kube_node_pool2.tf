resource "azurerm_kubernetes_cluster_node_pool" "kube_pool2" {
  for_each              =azurerm_kubernetes_cluster.kub2
  name                  = "${each.key}"
  kubernetes_cluster_id = each.value.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
}
