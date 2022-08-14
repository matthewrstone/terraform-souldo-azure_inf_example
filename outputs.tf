output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
    value = azurerm_resource_group.rg.location
}
output "network_interface_id" {
    value = azurerm_network_interface.network_interface.id
}

output "azure_ssh_public_key" {
    value = var.azure_ssh_public_key
}

