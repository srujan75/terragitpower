# Declare variables
$ServicePrincipalName = "terraformpowersp"

# Create Azure AD Application
$App = New-AzADApplication -DisplayName $ServicePrincipalName

# Create Service Principal
$ServicePrincipal = New-AzADServicePrincipal -ApplicationId $App.AppId

# Assign Contributor role to the Service Principal
New-AzRoleAssignment -ObjectId $ServicePrincipal.Id -RoleDefinitionName "Contributor"
