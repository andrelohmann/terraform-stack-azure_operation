resource "azurerm_public_ip" "vpn_gateway" {
    name                         = "${var.stack_name}-vpngateway-ip"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.operation_stack.name
    allocation_method            = "Dynamic"

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}
