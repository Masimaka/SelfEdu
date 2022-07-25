variable "resource_group_name" {
  default = "myTFResourceGroup"
}

variable "resource_group_location" {
  default = "westus2"
}
variable "resource_group_tags" {
  default = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.resource_group_tags
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}
