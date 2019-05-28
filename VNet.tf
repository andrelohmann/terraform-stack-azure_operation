resource "azurerm_virtual_network" "operation_stack" {
    name                = var.stack_name
    address_space       = ["10.10.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.operation_stack.name

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}

resource "azurerm_subnet" "subnet01" {
    name                 = "${var.stack_name}-subnet01"
    resource_group_name  = azurerm_resource_group.operation_stack.name
    virtual_network_name = azurerm_virtual_network.operation_stack.name
    address_prefix       = "10.10.1.0/24"
}

resource "azurerm_subnet" "subnet02" {
    name                 = "${var.stack_name}-subnet02"
    resource_group_name  = azurerm_resource_group.operation_stack.name
    virtual_network_name = azurerm_virtual_network.operation_stack.name
    address_prefix       = "10.10.2.0/24"
}

resource "azurerm_subnet" "subnet03" {
    name                 = "${var.stack_name}-subnet03"
    resource_group_name  = azurerm_resource_group.operation_stack.name
    virtual_network_name = azurerm_virtual_network.operation_stack.name
    address_prefix       = "10.10.3.0/24"
}
