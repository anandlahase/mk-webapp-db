resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.appservice_name
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "test-aap-ananad"
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  #(Optional)
  site_config {
dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
  
  #(Optional)
  app_settings = {
    "SOME_KEY" = "some-value"
  }

}
