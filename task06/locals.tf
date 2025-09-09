locals {
  name_prefix     = "cmaz-nw9g0zfg-mod6"
  rg_name         = join("-", [local.name_prefix, "rg"])
  sql_server_name = join("-", [local.name_prefix, "sql"])
  sql_db_name     = join("-", [local.name_prefix, "sql-db"])
  asp_name        = join("-", [local.name_prefix, "asp"])
  app_name        = join("-", [local.name_prefix, "app"])
}