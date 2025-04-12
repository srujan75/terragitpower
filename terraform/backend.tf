# Set variables
resourceGroup ="terraform-state-rg"
storageAccoun t="tfstatestorage1234"
containerName="tfstate"

# Create resource group and storage
az group create --name $resourceGroup --location eastus
az storage account create --name $storageAccount --resource-group $resourceGroup --location eastus --sku Standard_LRS

# Get storage key and create container
accountKey=$(az storage account keys list --resource-group $resourceGroup --account-name $storageAccount --query '[0].value' -o tsv)
az storage container create --name $containerName --account-name $storageAccount --account-key $accountKey
