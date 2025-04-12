# Set variables
resourceGroup="terraform-state-rg"
storageAccount="tfstatestorage1234"
containerName="tfstate"

# Create resource group and storage
az group create --name $resourceGroup --location eastus
az storage account create --name $storageAccount --resource-group $resourceGroup --location eastus --sku Standard_LRS

# Get storage key and create container
accountKey=$(az storage account keys list --resource-group $resourceGroup --account-name $storageAccount --query '[0].value' -o tsv)
az storage container create --name $containerName --account-name $storageAccount --account-key $accountKey

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstatestorage1234"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
