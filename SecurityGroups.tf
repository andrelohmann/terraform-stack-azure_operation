resource "azurerm_network_security_group" "vpn_gateway" {
    name                = "${var.stack_name}-vpngateway-sg"
    location            = var.location
    resource_group_name = azurerm_resource_group.operation_stack.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "OPENVPN"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1194"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}

resource "azurerm_network_security_group" "jenkins" {
    name                = "${var.stack_name}-jenkins-sg"
    location            = var.location
    resource_group_name = azurerm_resource_group.operation_stack.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "http"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}

resource "azurerm_network_security_group" "gitlab" {
    name                = "${var.stack_name}-gitlab-sg"
    location            = var.location
    resource_group_name = azurerm_resource_group.operation_stack.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "http"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}
