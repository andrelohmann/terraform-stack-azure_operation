module "vpn-gateway" {
  source                                      = "https://github.com/andrelohmann/terraform-module-azure_vm.git"
  location                                    = var.location
  environment                                 = var.environment
  stack_name                                  = "${var.stack_name}-gateway"
  resource_group_name                         = azurerm_resource_group.operation_stack.name
  computer_name                               = "${var.stack_name}-gateway"
  vm_size                                     = "Standard_B1ls"
  vm_tags                                     = { ephemeral = false }
  admin_user                                  = var.admin_user
  pub_key                                     = var.pub_key
  boot_diagnostics_uri                        = azurerm_storage_account.operation_stack.primary_blob_endpoint
  network_security_group_id                   = azurerm_network_security_group.vpn_gateway.id
  subnet_id                                   = azurerm_subnet.subnet01.id
  private_ip_addres                           = "10.10.1.10"
  public_ip_address_id                        = azurerm_public_ip.vpn_gateway.id
}
