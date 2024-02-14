terraform {
  backend "azurerm" {
    resource_group_name  = "terra-sample-rg"
    storage_account_name = "terrasan"
    container_name       = "terrafile"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}
