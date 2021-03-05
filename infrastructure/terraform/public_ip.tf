resource "azurerm_public_ip" "demo-public-ip" {
  name                = "acceptancePublicIp1-${var.environment}"
  resource_group_name = azurerm_resource_group.demo-resource-group.name
  location            = azurerm_resource_group.demo-resource-group.location
  allocation_method   = "Static"
  sku = "Standard"

  tags = {
    source = "Terraform"
    environment    = var.environment
    department = var.department
  }
}