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
    sku_name           = "S1"
    resource_group_key = "rg1"
    worker_count       = 2
  },
  asp2 = {
    name               = "cmaz-nw9g0zfg-mod5-asp-02"
    os_type            = "Linux"
    sku_name           = "S1"
    resource_group_key = "rg2"
    worker_count       = 1
  }
}


app_services = {
  "app1" = {
    name                 = "cmaz-nw9g0zfg-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  },
  "app2" = {
    name                 = "cmaz-nw9g0zfg-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

app_service_site_config = {
  "app1" = {

  },
  "app2" = {

  }
}

app_service_ip_restriction = [
  {
    ip_address  = "18.153.146.156/32"
    action      = "Allow"
    priority    = 100
    name        = "allow-ip"
    description = "Allow traffic from a specific IP of verification agent"
  },
  {
    service_tag = "AzureTrafficManager"
    action      = "Allow"
    priority    = 110
    name        = "allow-tm"
    description = "Allow traffic from Azure Traffic Manager service tag"
  }
]

traffic_manager_name                     = "cmaz-nw9g0zfg-mod5-traf"
traffic_manager_dns_config_relative_name = "cmaz-nw9g0zfg-mod5-traf"
traffic_manager_dns_config_ttl           = 300
traffic_manager_resource_group_key       = "rg3"
traffic_manager_location                 = "East US"
traffic_manager_traffic_routing_method   = "Performance"
traffic_manager_monitor_config = {
  protocol = "HTTP"
  port     = 80
  path     = "/"
}

traffic_manager_endpoints = {
  "app1" = {
    name                   = "cmaz-nw9g0zfg-mod5-app-ep-01"
    target_resource_id_key = "app1"
    weight                 = 1
    priority               = 1
  },
  "app2" = {
    name                   = "cmaz-nw9g0zfg-mod5-app-ep-02"
    target_resource_id_key = "app2"
    weight                 = 1
    priority               = 2
  }
}

common_tags = {
  "Creator" = "oleksandr_peresunko@epam.com"
}