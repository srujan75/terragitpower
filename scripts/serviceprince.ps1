# Variables
$ServicePrincipalName = "terraformpowersp"
$AzSubscriptionName   = "Azure for Students"
$endDate              = "2025-12-06T00:00:00Z"

# Log in and set the subscription
Connect-AzAccount
$Subscription = Get-AzSubscription -SubscriptionName $AzSubscriptionName
Select-AzSubscription -SubscriptionId $Subscription.Id

# 1. Create Azure AD Application (App Registration)
$App = New-AzADApplication -DisplayName $ServicePrincipalName

# 2. Create Service Principal based on the App
$ServicePrincipal = New-AzADServicePrincipal -ApplicationId $App.AppId

# 3. Create a client secret (App Credential) using Application ObjectId
$clientSecret = New-AzADAppCredential `
    -ObjectId $App.Id `
    -EndDate $endDate

# 4. Output values
$OutputObject = [PSCustomObject]@{
    clientId       = $App.AppId
    subscriptionId = $Subscription.Id
    clientSecret   = $clientSecret.SecretText
    tenantId       = $Subscription.TenantId
}

$OutputObject | ConvertTo-Json -Depth 3
