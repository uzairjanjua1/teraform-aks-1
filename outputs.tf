output "resource_group_name" {
  value = azurerm_resource_group.test.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
