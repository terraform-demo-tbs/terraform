resource "azurerm_resource_group" "demo-resource-group" {
  name     = "demo-terraform-${var.environment}"
  location = "West Europe"
  tags = {
    source = "Terraform"
    environment    = var.environment
    department = var.department
  }
}