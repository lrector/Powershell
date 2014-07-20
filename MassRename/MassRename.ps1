$conn = New-Object System.Data.SQLClient.SQLConnection
$conn.ConnectionString = "Data Source = TerraT4;Database=FerryWA;Integrated Security = SSPI"

$cmdText1 = "SELECT ParcelID, ParcelNumber FROM tAA_Parcel WHERE IsDeleted = 0 AND ParcelTypeID = 1 AND RollYear = 2013"

$conn.Open()
$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText1,$conn)
$rdr = $cmd.ExecuteReader()
While ($rdr.Read())
	{$TIDs = @($rdr["ParcelID"].ToString(),$rdr["ParcelNumber"].ToString())
	}
$conn.Close()

foreach ($Pair in $TIDs) {$Pair}
$TIDs