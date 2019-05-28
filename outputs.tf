/**
 * Gateway Public IP
 */
data "azurerm_public_ip" "gateway" {
  name                = azurerm_public_ip.vpn_gateway.name
  resource_group_name = azurerm_resource_group.operation_stack.name
}
output "gateway_public_ip" {
  value = "${data.azurerm_public_ip.gateway.ip_address}"
}
