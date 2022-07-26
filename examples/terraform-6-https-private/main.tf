terraform {
  backend "azurerm" {
    resource_group_name  = "removelocked"
    storage_account_name = "adolearnlocker"
    container_name       = "selfedugit"
    key                  = "terraform/github/examples/terraform-5-ssh.tfstate"
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


module "resource_group_example5" {
  source              = "git@github.com:Masimaka/1//tfmodules/resource_group"
  resource_group_name = "terraform-examle5"
  resource_group_tags = {
    Environment = "stage"
    Team        = "DevOps"

  }
}