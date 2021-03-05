resource "azurerm_servicebus_namespace" "demo-servicebus-namespace" {
  name                = "demo-namespace-${var.environment}"
  location            = azurerm_resource_group.demo-resource-group.location
  resource_group_name = azurerm_resource_group.demo-resource-group.name
  sku                 = "Standard"

  tags = {
    source = "Terraform"
    environment    = var.environment
    department = var.department
  }
}

resource "azurerm_servicebus_queue" "demo-servicebus-queue" {
  name                  = "${var.sbname.name}-${var.environment}"
  resource_group_name   = azurerm_resource_group.demo-resource-group.name
  namespace_name        = azurerm_servicebus_namespace.demo-servicebus-namespace.name
  max_size_in_megabytes = 1024

  enable_partitioning = false
}

