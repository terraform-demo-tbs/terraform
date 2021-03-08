resource "azurerm_kubernetes_cluster" "demo-aks" {
  name                = "aks-${var.environment}"
  location            = azurerm_resource_group.demo-resource-group.location
  resource_group_name = azurerm_resource_group.demo-resource-group.name
  dns_prefix          = "aks-${var.environment}"

  default_node_pool {
    name               = "nodepool1"
    node_count         = 3
    vm_size            = "Standard_DS2_v2"
    availability_zones = ["1", "2", "3"]
  }

  service_principal {
    client_id     = var.ARM_CLIENT_ID
    client_secret = var.ARM_CLIENT_SECRET
  }

  tags = {
    source      = "Terraform"
    environment    = var.environment
  }
}