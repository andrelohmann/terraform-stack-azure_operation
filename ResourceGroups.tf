resource "azurerm_resource_group" "operation_stack" {
    name     = var.stack_name
    location = var.location

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}
