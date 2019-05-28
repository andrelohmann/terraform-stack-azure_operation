resource "azurerm_storage_account" "operation_stack" {
    name                      = "diag${random_id.randomId.hex}"
    resource_group_name       = azurerm_resource_group.operation_stack.name
    location                  = var.location
    account_replication_type  = "LRS"
    account_tier              = "Standard"

    tags = {
        environment                   = var.environment
        stack_name                    = var.stack_name
    }
}
