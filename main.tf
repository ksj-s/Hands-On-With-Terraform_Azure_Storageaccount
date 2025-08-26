terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "Terraform_Azure_KSJ"

    workspaces {
      name = "Hands-On-With-Terraform_Azure_Storageaccount"
    }
  }
}
provider "azurerm" {
  features {

  }
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  resource_provider_registrations = "none"
}
resource "azurerm_resource_group" "rg" {
  name     = "813-a2a68dd2-hands-on-with-terraform-on-azure"
  location = "West US"

}

module "securestorage" {
  source  = "app.terraform.io/Terraform_Azure_KSJ/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "ksjteststorage232423"
}