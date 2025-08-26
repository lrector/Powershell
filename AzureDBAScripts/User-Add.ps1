# Define the user to add to the Azure SQL databases
$user = Read-Host -Prompt "Please enter the email address of the user to add"

# Define the role to assign to the user (db_owner, db_datareader, db_datawriter, SupportTier1, etc.)
$role = Read-Host -Prompt "What role to assign to the user? (db_owner, db_datareader, db_datawriter, SupportTier1, etc.)"

# Connect to Azure account using Entra MFA
Write-Host "Authenticating"
Connect-AzAccount -TenantId 4076f68b-927d-464b-83be-6d6835686e1d
#$access_token = (Get-AzAccessToken -ResourceUrl https://database.windows.net).Token
$access_token = (ConvertFrom-SecureString (Get-AzAccessToken -ResourceUrl https://database.windows.net -AsSecureString).Token -AsPlainText)

# Define the Azure SQL server and queries to run
$serverName = "beehivesrv01.database.windows.net"
$userQuery = "IF DATABASE_PRINCIPAL_ID('$user') IS NULL
    BEGIN
        CREATE USER [$user] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo];
    END"
$roleQuery = "IF DATABASE_PRINCIPAL_ID('$user') IS NOT NULL
    BEGIN
        exec sys.sp_addrolemember @rolename = N'$role', @membername = N'$user';
    END"

# Get the list of databases on the server 
Write-Host "Getting list of databases"
$databases = Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database "master" -AccessToken "$access_token" -Query "SELECT name FROM sys.databases WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')"

# Add user to master database
Write-Host "Adding user to master database"
Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database "master" -AccessToken "$access_token" -Query "$userQuery"

# Loop through each database and execute the query
foreach ($db in $databases) {
    $dbName = $db.name
    Write-Host "Adding user to database: $dbName" 

    # Add User to database
    Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database $dbName -AccessToken "$access_token" -Query "$userQuery"

    # Add User to db_owner role
    Invoke-Sqlcmd -ServerInstance $serverName -TrustServerCertificate -Database $dbName -AccessToken "$access_token" -Query "$roleQuery"
}