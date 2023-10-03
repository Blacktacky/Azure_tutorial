resource "azurerm_linux_web_app_slot" "alwas" {
  for_each       =azurerm_linux_web_app.alwa
  name           = "${each.key}"
  app_service_id = azurerm_linux_web_app.alwa.id

  site_config {}
}
