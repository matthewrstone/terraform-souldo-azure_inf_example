resource "azurerm_resource_group" "rg" {
  name = var.name
  location = var.region
  tags = {
    project_name = var.name
    environment = var.environment
  }
}

resource "azurerm_subnet" "subnet" {
  name = "${var.name}-subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virt_net.name
  address_prefixes = [
      var.cidr
  ]
}

resource "azurerm_virtual_network" "virt_net" {
  name = "${var.name}-virt_net"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [ var.cidr ]
  tags = {
      project_name = var.name
      environment = var.environment
  }
}

resource "azurerm_network_security_group" "nsg" {
    name = "${var.name}-nsg"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = {
        project_name = var.name
        environment = var.environment
    }

    security_rule {
        name      = "ssh"
        priority  = 107
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"
        source_port_range = "*"
        source_address_prefix = "*"
        destination_port_range = "22"
        destination_address_prefix = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
