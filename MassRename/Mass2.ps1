param([string]$Server = "Server", [string]$DB = "DB", [string]$SourceDir = "Source", [string]$DestDir = "Destination")

function Invoke-Sqlcmd2
{
    param(
    [string]$ServerInstance,
    [string]$Database,
    [string]$Query,
    [Int32]$QueryTimeout=30
    )

    $conn=new-object System.Data.SqlClient.SQLConnection
    $conn.ConnectionString="Server={0};Database={1};Integrated Security=True" -f $ServerInstance,$Database
    $conn.Open()
    $cmd=new-object system.Data.SqlClient.SqlCommand($Query,$conn)
    $cmd.CommandTimeout=$QueryTimeout
    $ds=New-Object system.Data.DataSet
    $da=New-Object system.Data.SqlClient.SqlDataAdapter($cmd)
    [void]$da.fill($ds)
    $conn.Close()
    $ds.Tables[0]

}

ni "RenameApex.bat" -force -type "file"

$Ext = ".ax4"

$list = @{}

Invoke-Sqlcmd2 $Server $DB "SELECT ParcelID, ParcelNumber FROM tAA_Parcel WHERE RollYear = 2013 AND IsDeleted = 0 AND ParceltypeID = 1" | foreach {[void]$list.Add($_.ParcelID, $_.ParcelNumber)}

foreach ($parcel in $list.keys)
	{
		"ECHO F| XCOPY " + $SourceDir + $parcel + $Ext + " " + $DestDir + $list.$parcel + $Ext + " /y" | ac RenameApex.bat
	}

.\RenameApex.bat	