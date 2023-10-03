provider "azurerm" {
  features {}
}

resource "azurerm_windows_web_app_slot" "wwas" {
  name           = "example-slot"
  app_service_id = azurerm_windows_web_app.awwa.id

  site_config {}
}
