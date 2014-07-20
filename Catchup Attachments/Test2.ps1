$Data = gc info.ini
$County = $Data[1]
$User = $Data[2]
$Pass = $Data[3]
$DB = $Data[7]
$Server = $Data[8]
$TForms = $Data[13..22] | where {$_ -ne ""}
$AForms = $Data[25..34] | where {$_ -ne ""}

$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "Data Source=$Server;Database=$DB; Integrated Security = SSPI"
$cmdText1 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TSFILE1'"
$cmdText2 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TSFILE2'"
$cmdText3 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TR_CountyName'"
$cmdText4 = "SELECT CfgValue FROM tTS_Cfg WHERE CfgName = 'TR_SifterFTPList'"

$conn.Open()
$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText1,$conn)
$rdr = $cmd.ExecuteReader()
While ($rdr.Read())
	{$TAttachments = $rdr["CfgValue"].ToString()}
$conn.Close()

$conn.Open()
$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText2,$conn)
$rdr = $cmd.ExecuteReader()
While ($rdr.Read())
	{$AAttachments = $rdr["CfgValue"].ToString()}
$conn.Close()

$conn.Open()
$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText3,$conn)
$rdr = $cmd.ExecuteReader()
While ($rdr.Read()) 
	{$County = $rdr["CfgValue"].ToString()}
$conn.Close()

$CountyReplace = $County + "ftplist.txt"

$conn.Open()
$cmd = New-Object System.Data.SqlClient.SqlCommand($cmdText4,$conn)
$rdr = $cmd.ExecuteReader()
While ($rdr.Read())
	{$WorkingDir = $rdr["CfgValue"].ToString()}
$conn.Close()

$WorkingDir = $WorkingDir | %{$_ -replace "$CountyReplace", ""}
$CountyAttachments = $County + "attachments.txt"
$Name = $County + "host.txt"
ni $name -force -type "file"
ac $name "OPEN ftp.taxsifter.com"
ac $name "$User"
ac $name "$Pass"
ac $name "get $Countyattachments"
ac $name "quit"

#ftp "-s:$Name"

$temp1 = $WorkingDir + "Attachments.txt"
#ni $temp1 -force -type "file"
$temp4 = "Diff.bat"
$temp5 = "ECHO F| XCOPY " + $AttachmentLocation
$temp6 = $workingDir + "Overnight\"

$temp3 = $TAttachments -replace "\\", "\\"
$TAttachments
$temp3