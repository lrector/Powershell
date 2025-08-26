# Define the user to remove from Azure SQL databases
$user = Read-Host -Prompt "Please enter the email address of the user to remove"

# Connect to Azure account using Entra MFA
Write-Host "Authenticating"
Connect-AzAccount -TenantId 4076f68b-927d-464b-83be-6d6835686e1d
$access_token = (Get-AzAccessToken -ResourceUrl https://database.windows.net).Token

# Define the Azure SQL server and queries to run
$serverName = "beehivesrv01.database.windows.net"
$userQuery = "IF DATABASE_PRINCIPAL_ID('$user') IS NOT NULL
    BEGIN
        DROP USER [$user];
    END"

# Get the list of databases on the server
Write-Host "Getting list of databases"
$databases = Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database "master" -AccessToken "$access_token" -Query "SELECT name FROM sys.databases WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')"

# Remove user from master database
Write-Host "Removing user from master database"
Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database "master" -AccessToken "$access_token" -Query "$userQuery"

# Loop through each database and execute the query
foreach ($db in $databases) {
    $dbName = $db.name
    Write-Host "Removing user to database: $dbName" 

    # Remove User from database
    Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database $dbName -AccessToken "$access_token" -Query "$userQuery"
}