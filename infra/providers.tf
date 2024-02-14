terraform {

  required_version = ">=1.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "cd-teroidc-shared"
    storage_account_name = "gnzteroidc"
    container_name       = "tfstate"
    key                  = "dev.teroidc.tfstate"
  }
}

provider "azurerm" {
  features {}
}