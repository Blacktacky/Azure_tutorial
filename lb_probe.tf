resource "azurerm_lb_probe" "lbp" {
  loadbalancer_id = azurerm_lb.alb.id
  name            = "ssh-running-probe"
  port            = 22
}
