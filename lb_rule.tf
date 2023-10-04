resource "azurerm_lb_rule" "lbr" {
  loadbalancer_id                = azurerm_lb.alb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}
