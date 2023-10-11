locals{
  rainbow_ops=["bandit","ace","thermite","sledge","buck","smoke","mute","iq","zofia","ela","jaeger"]

  linux_app=[for f in fileset("${path.module}/yaml", "[^_]*.yaml") : yamldecode(file("${path.module}/yaml/${f}"))]
  linux_app_list = flatten([
  for app in local.linux_app : [
      for linuxapps in try(app.listoflinuxapp, []) :{
        name=linuxapps.name
        os_type=linuxapps.os_type
        sku_name=linuxapps.sku_name
              }
    ]
])
}

resource "azurerm_service_plan" "lasp" {
  for_each            ={for app in local.linux_app_list: "${app.name}"=>app}
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_resource_group.azure_tutorial.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "alwa" {
  for_each            = azurerm_service_plan.lasp
  name                = "${var.prefix}rainbow-${each.key}"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_service_plan.lasp.location
  service_plan_id     = each.value.id

  site_config {}
}
