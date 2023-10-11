locals{
  jedi_names=["anakin","obiwan","yoda","mace","krell","fisto","ahsoka","plokoon","luke","dooku"]

  win_app=[for f in fileset("${path.module}/yaml", "[^_]*.yaml"] : yamldecode(file("${path.module}/yaml/${f}"))]
  win_app_list = flatten([
  for app in local.win_app : [
    for winapps in try(app.listofwinapp, [] :{
      name=winapps.name
      os_type=winapps.os_type
      sku_name=winapps.sku_name
            }
    ]
])
}

resource "azurerm_service_plan" "wasp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_resource_group.azure_tutorial.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "awwa" {
  for_each            ={for jedi in local.jedi_names:jedi=>jedi}
  name                = "${var.prefix}jedi-${each.key}"
  resource_group_name = azurerm_resource_group.azure_tutorial.name
  location            = azurerm_service_plan.wasp.location
  service_plan_id     = azurerm_service_plan.wasp.id

  site_config {}
}
