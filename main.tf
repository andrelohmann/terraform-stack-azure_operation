module "vpn-gateway" {
  source                                      = "github.com/andrelohmann/terraform-module-azure_vm"
  location                                    = var.location
  environment                                 = var.environment
  stack_name                                  = "${var.stack_name}"
  vm_name                                     = "${var.stack_name}-gateway"
  resource_group_name                         = azurerm_resource_group.operation_stack.name
  computer_name                               = "${var.stack_name}-gateway"
  vm_size                                     = "Standard_B1ls"
  vm_tags                                     = { ephemeral = false }
  admin_user                                  = var.admin_user
  pub_key                                     = var.pub_key
  boot_diagnostics_uri                        = azurerm_storage_account.operation_stack.primary_blob_endpoint
  network_security_group_id                   = azurerm_network_security_group.vpn_gateway.id
  subnet_id                                   = azurerm_subnet.subnet01.id
  private_ip_address_allocation               = "Static"
  private_ip_address                          = "10.10.1.10"
  public_ip_address_id                        = azurerm_public_ip.vpn_gateway.id
}

module "jenkins" {
  source                                      = "github.com/andrelohmann/terraform-module-azure_vm"
  location                                    = var.location
  environment                                 = var.environment
  stack_name                                  = "${var.stack_name}"
  vm_name                                     = "${var.stack_name}-jenkins"
  resource_group_name                         = azurerm_resource_group.operation_stack.name
  computer_name                               = "${var.stack_name}-jenkins"
  vm_size                                     = "Standard_B2s"
  vm_tags                                     = { ephemeral = false }
  admin_user                                  = var.admin_user
  pub_key                                     = var.pub_key
  boot_diagnostics_uri                        = azurerm_storage_account.operation_stack.primary_blob_endpoint
  network_security_group_id                   = azurerm_network_security_group.jenkins.id
  subnet_id                                   = azurerm_subnet.subnet02.id
  private_ip_address_allocation               = "Static"
  private_ip_address                          = "10.10.2.10"
}

module "gitlab" {
  source                                      = "github.com/andrelohmann/terraform-module-azure_vm"
  location                                    = var.location
  environment                                 = var.environment
  stack_name                                  = "${var.stack_name}"
  vm_name                                     = "${var.stack_name}-gitlab"
  resource_group_name                         = azurerm_resource_group.operation_stack.name
  computer_name                               = "${var.stack_name}-gitlab"
  vm_size                                     = "Standard_B2s"
  vm_tags                                     = { ephemeral = false }
  admin_user                                  = var.admin_user
  pub_key                                     = var.pub_key
  boot_diagnostics_uri                        = azurerm_storage_account.operation_stack.primary_blob_endpoint
  network_security_group_id                   = azurerm_network_security_group.gitlab.id
  subnet_id                                   = azurerm_subnet.subnet03.id
  private_ip_address_allocation               = "Static"
  private_ip_address                          = "10.10.3.10"
}
