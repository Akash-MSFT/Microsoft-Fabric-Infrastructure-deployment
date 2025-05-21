terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.29.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "1.1.0"
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
  preview = true # Spark Custom Pool and Spark Workspace Settings are in preview
}

