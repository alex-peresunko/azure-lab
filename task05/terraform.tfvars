resource_groups = {
  rg1 = {
    name     = "cmaz-nw9g0zfg-mod5-rg-01"
    location = "West Europe"
  },
  rg2 = {
    name     = "cmaz-nw9g0zfg-mod5-rg-02"
    location = "North Europe"
  },
  rg3 = {
    name     = "cmaz-nw9g0zfg-mod5-rg-03"
    location = "East US"
  }
}
app_service_plans = {
  asp1 = {
    name               = "cmaz-nw9g0zfg-mod5-asp-01"
    os_type            = "Linux"
    sku_name           = "P0v3"
    resource_group_key = "rg1"
    worker_count       = 2
  },
  asp2 = {
    name               = "cmaz-nw9g0zfg-mod5-asp-02"
    os_type            = "Linux"
    sku_name           = "P1v3"
    resource_group_key = "rg2"
    worker_count       = 1
  }
}
