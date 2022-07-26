terraform {
  backend "azurerm" {
    resource_group_name  = "removelocked"
    storage_account_name = "adolearnlocker"
    container_name       = "selfedugit"
    key                  = "terraform/github/examples/terraform-6-https-private.tfstate"
  }

  required_providers {
    azurerm = {
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "resource_group_example6" {
  source              = "https://github.com/Masimaka/1.git//tfmodules/resource_group"
  resource_group_name = "terraform-examle6"
  resource_group_tags = {
    Environment = "stage"
    Team        = "DevOps"

  }
}