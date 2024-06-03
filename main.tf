resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "test1-aks"
  location            = var.location
  resource_group_name = azurerm_resource_group.test.name
  dns_prefix          = "dev-aks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "sqlserver${random_string.server_suffix.result}"
  resource_group_name          = azurerm_resource_group.test.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password


  tags = {
    environment = "testing"
  }
}

resource "azurerm_sql_database" "sql_database" {
  name                = "mydatabase"
  resource_group_name = azurerm_resource_group.test.name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
 

  tags = {
    environment = "testing"
  }
}

resource "random_string" "server_suffix" {
  length  = 8
  special = false
}
