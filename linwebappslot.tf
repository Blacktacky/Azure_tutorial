resource "azurerm_linux_web_app_slot" "alwas" {
  name           = "example-slot"
  app_service_id = azurerm_linux_web_app.alwa.id

  site_config {}
}
