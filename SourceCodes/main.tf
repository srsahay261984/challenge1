provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source         = "./resources/resourcegroup"
  name           = var.name
  location       = var.location
}

module "networking" {
  source         = "./resources/networking"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
}

module "securitygroup" {
  source         = "./resources/securitygroup"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  web_subnet_id  = module.networking.websubnet_id
  app_subnet_id  = module.networking.appsubnet_id
  db_subnet_id   = module.networking.dbsubnet_id
}

module "compute" {
  source         = "./resources/compute"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id = module.networking.websubnet_id
  app_subnet_id = module.networking.appsubnet_id
  web_host_name = var.web_host_name
  web_username = var.web_username
  web_os_password = var.web_os_password
  app_host_name = var.app_host_name
  app_username = var.app_username
  app_os_password = var.app_os_password
}

module "database" {
  source = "./resources/database"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  primary_database = var.primary_database
  primary_database_version = var.primary_database_version
  primary_database_admin = var.primary_database_admin
  primary_database_password = var.primary_database_password
}
