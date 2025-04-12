#!/bin/bash

# Set variables
resourceGroup="rg-terraform-state"
storageAccount="tfstatestoragereddy"
containerName="tfstate"
location="eastus"

# Create resource group
echo "Creating resource group..."
az group create --name $resourceGroup --location $location

# Create storage account
echo "Creating storage account..."
az storage account create \
  --name $storageAccount \
  --resource-group $resourceGroup \
  --location $location \
  --sku Standard_LRS

# Get storage account key
echo "Retrieving storage account key..."
accountKey=$(az storage account keys list \
  --resource-group $resourceGroup \
  --account-name $storageAccount \
  --query '[0].value' -o tsv)

# Create blob container
echo "Creating blob container for Terraform state..."
az storage container create \
  --name $containerName \
  --account-name $storageAccount \
  --account-key $accountKey
