terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #  version = ">=3.0.0"
      version = "4.14.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "0.1.0-beta.8"
    }
  }
  backend "azurerm" { ###### Configure the below values in the devops variable group to generate state file in Azure Storage Account
    resource_group_name  = "$(backendAzureRmResourceGroupName)"
    storage_account_name = "$(backendAzureRmStorageAccountName)"
    container_name       = "$(backendAzureRmContainerName)"
    key                  = "$(backendAzureRmKey)"
  }
}

#Configure the Microsoft Fabric Terraform Provider
provider "fabric" {
  # Configuration options
}

