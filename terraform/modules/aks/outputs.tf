output "kubelet_object_id" {
  value = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.this.name
}
