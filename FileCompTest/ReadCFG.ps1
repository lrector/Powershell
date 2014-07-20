$conn = New-Object System.Data.SqlClient.SqlConnection

$conn.ConnectionString = "Data Source=TERRAT4;Database=StevensWA; Integrated Security = SSPI"

$cmdText1 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TSFILE1'"
$cmdText2 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TSFILE2'"
$cmdText3 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TR_CountyName'"
$cmdText4 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TR_SifterFTPList'"

$conn.Open()

$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText1,$conn)

$rdr = $cmd.ExecuteReader()

While ($rdr.Read())
{

$TAttachments = $rdr["CfgValue"].ToString()

}

$conn.Close()

$conn.Open()

$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText2,$conn)

$rdr = $cmd.ExecuteReader()

While ($rdr.Read())
{

$AAttachments = $rdr["CfgValue"].ToString()

}

$conn.Close()

$conn.Open()

$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText3,$conn)

$rdr = $cmd.ExecuteReader()

While ($rdr.Read())
{

$County = $rdr["CfgValue"].ToString()

}

$conn.Close()

$CountyReplace = $County + "ftplist.txt"

$conn.Open()

$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText4,$conn)

$rdr = $cmd.ExecuteReader()

While ($rdr.Read())
{

$WorkingDir = $rdr["CfgValue"].ToString()

}

$conn.Close()

$WorkingDir = $WorkingDir | %{$_ -replace "$CountyReplace", ""}

$TAttachments
$AAttachments
$WorkingDir
$County
