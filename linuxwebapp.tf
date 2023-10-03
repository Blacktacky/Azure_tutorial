locals{
  rainbow_ops=["bandit","ace","thermite","sledge","buck","smoke","mute","iq","zofia","ela","jaeger"]
}

resource "azurerm_service_plan" "lasp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_resource_group.azure_tutorial.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "alwa" {
  for_each            ={for rainbow in local.rainbow_ops:rainbow=>rainbow}
  name                = "${var.prefix}rainbow-${each.key}"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_service_plan.lasp.location
  service_plan_id     = azurerm_service_plan.lasp.id

  site_config {}
}
