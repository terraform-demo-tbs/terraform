output "ServiceBus_connection_string" {
  value = azurerm_servicebus_namespace.demo-servicebus-namespace.default_primary_connection_string
}

output "public_IP" {
  value = azurerm_public_ip.demo-public-ip.ip_address
}

/* output "client_certificate" {
  value = azurerm_kubernetes_cluster.demo-aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.demo-aks.kube_config_raw
} */

output "function_hostname" {
  value = azurerm_function_app.demo-function.default_hostname
}