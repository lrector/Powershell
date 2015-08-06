##############################################################################
#
# Import nutshell backups into SQL
# 
# Lance Rector 20150806
#
###############################################################################

# Find name of current export - abort if no current export
CLS
c:
cd \nutshellbackups
$ExportFile = Get-ChildItem -Filter "*.zip"
$SQLServer = "BH-Tilecache1"
$SQLDBName = "Nutshell_Ultra"
Write-Host "Importing Nutshell Backup File"

Try
	{
		IF ($ExportFile) 
			{
				$FileName = $ExportFile.ToString()
				$Date = Get-Date -format yyyyMMdd
				$Destination = "c:\NutshellBackups\Temp\"
				$Target = $Destination + $FileName -replace (".zip","")
				##Copy blank CSV files into proper directory
				Copy-Item .\Temp\Empties\*.csv .\Temp

				##Unzip export to temp directory
				$ShellApp = New-Object -com shell.application
				$ZipFile = $ShellApp.namespace($ExportFile.FullName)
				$CopyHere = $ShellApp.namespace("$Destination")
				$CopyHere.Copyhere($ZipFile.items())
				Move-Item $Target\*.csv $Destination -force
				Remove-Item $Target

				##Call SP Nutshell_Ultra.ImportAll
				$SQLQuery = "EXEC dbo.ImportAll '$FileName', '$Date'"
				$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
				$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; User Id=Import; Password=import;"

				$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
				$SqlCmd.CommandText = $SQLQuery
				$SqlCmd.Connection = $SqlConnection
				$SqlCmd.Connection.Open()
				$text = $SQLQuery.Substring(0, 50)
				Write-Progress -Activity "Executing SQL" -Status "Executing SQL => ..."
				Write-Host "Executing SQL => ..."
				$Result = $SqlCmd.ExecuteNonQuery()
				$SqlConnection.Close()
				
				##Archive downloaded export file
				Move-Item $FileName ".\NUTSHELL_BACKUP_UNZIPPED" -force
				$Message = "Import Successful "
			
			}
		Else
			{
				$Message = "No Export Zip Found"
			}
	}
Catch
	{
		$ErrorMessage = $_.Exception.Message
		$FailedItem = $_.Exception.ItemName
		$Message = $Message + "`n$ErrorMessage `n$FailedItem"
	}
Finally
	{
		ni Output.txt -type file -force | Out-Null
		$Message = $Message + "`r`n" + $FileName +"`r`n"+ $Date 
		$Message | ac Output.txt
		.\Slack2.ps1
	}