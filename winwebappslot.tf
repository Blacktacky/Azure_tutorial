resource "azurerm_windows_web_app_slot" "wwas" {
  for_each       =azurerm_windows_web_app.awwa
  name           = "${each.key}"
  app_service_id =each.value.id


  site_config {}
}
