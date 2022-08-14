output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
    value = azurerm_resource_group.rg.location
}

output "azure_ssh_public_key" {
    value = var.azure_ssh_public_key
}

output "subnet_id" {
    value = azurerm_subnet.subnet.id
}