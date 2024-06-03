resource "azurerm_resource_group" "test" {
  name     = "rg-aks-tr"     
  location = "eastus"           
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "test1-aks"                         # Name of the AKS cluster
  location            = "eastus"  # Location of the AKS cluster
  resource_group_name = "rg-aks-tr"      # Resource group name
  dns_prefix          = "dev-aks"                          # DNS prefix for the AKS cluster

  default_node_pool {
    name       = "default"                                    # Name of the default node pool
    node_count = 2                                            # Number of nodes in the node pool
    vm_size    = "Standard_DS2_v2"                            # VM size for the nodes
  }

  identity {
    type = "SystemAssigned"                                   # Identity type for the AKS cluster
  }
}
