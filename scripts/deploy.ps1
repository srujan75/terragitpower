# Define variables
$resourceGroup = "rg-terraformpower"
$location = "North Europe"
$storageAccountName = "terraformpwerstorage"
$containerName = "terraformpower-state"

# Login to Azure if not already authenticated
Connect-AzAccount | Out-Null

# Create Azure Resource Group
New-AzResourceGroup -Name $resourceGroup -Location $location -Force | Out-Null

# Create an Azure Storage Account
New-AzStorageAccount `
    -ResourceGroupName $resourceGroup `
    -Name $storageAccountName `
    -Location $location `
    -SkuName Standard_LRS `
    -Kind StorageV2 `
    -AllowBlobPublicAccess $false | Out-Null

# Get the storage context
$ctx = (Get-AzStorageAccount -ResourceGroupName $resourceGroup -Name $storageAccountName).Context

# Create a blob container inside the storage account
New-AzStorageContainer -Name $containerName -Context $ctx -Permission Off | Out-Null

# Output result as JSON
$OutputObject = [PSCustomObject]@{
    resourceGroup      = $resourceGroup
    storageaccountname = $storageAccountName
    containername      = $containerName
}

$OutputObject | ConvertTo-Json -Depth 2
