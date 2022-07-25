terraform {
  backend "azurerm" {
    resource_group_name  = "removelocked"
    storage_account_name = "adolearnlocker"
    container_name       = "selfedugit"
    key                  = "terraformgithubexample2.tfstate"
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

data "azurerm_client_config" "current" {}

#====== resources ======
module "resource_group_example2" {
  source              = "./modules/resource_group"
  resource_group_name = "terraform-examle2"
  resource_group_tags = {
    Environment = "stage"
    Team        = "DevOps"

  }
}


#====== outputs ======
output "resource_group_id" {
  value = module.resource_group_example2.resource_group_id
}

output "resource_group_location" {
  value = module.resource_group_example2.resource_group_location
}


#Create Virtual Network
#resource "azurerm_virtual_network" "vnet" {
#  name                = "tamops-vnet"
#  address_space       = ["192.168.0.0/16"]
#  location            = "eastus2"
#  resource_group_name = azurerm_resource_group.tamops.name
#}

# Create Subnet
#resource "azurerm_subnet" "subnet" {
#  name                 = "subnet"
#  resource_group_name  = azurerm_resource_group.tamops.name
#  virtual_network_name = azurerm_virtual_network.vnet.name
#  address_prefixes     = ["192.168.0.0/24"]
#}
