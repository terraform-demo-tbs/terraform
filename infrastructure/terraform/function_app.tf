resource "random_string" "prefix" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "demo-storage-account" {
  name                     = "${var.environment}funcsappsa${random_string.prefix.id}"
  resource_group_name      = azurerm_resource_group.demo-resource-group.name
  location                 = azurerm_resource_group.demo-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    source = "Terraform"
    environment    = var.environment
    department = var.department
  }
}


resource "azurerm_app_service_plan" "demo-app-service-plan" {
  name                = "${var.funcname.name}-service-plan-${var.environment}"
  location            = azurerm_resource_group.demo-resource-group.location
  resource_group_name = azurerm_resource_group.demo-resource-group.name
  kind                = "functionapp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  tags = {
    source = "Terraform"
    environment    = var.environment
  }
}

resource "azurerm_function_app" "demo-function" {
  name                       = "${var.funcname.name}-${var.environment}"
  location                   = azurerm_resource_group.demo-resource-group.location
  resource_group_name        = azurerm_resource_group.demo-resource-group.name
  app_service_plan_id        = azurerm_app_service_plan.demo-app-service-plan.id
  storage_account_name       = azurerm_storage_account.demo-storage-account.name
  storage_account_access_key = azurerm_storage_account.demo-storage-account.primary_access_key
  os_type                    = "linux"

  tags = {
    source = "Terraform"
    environment    = var.environment
    department = var.department
  }
}