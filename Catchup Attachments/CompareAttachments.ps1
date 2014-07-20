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

ftp "-s:$Name"

$temp1 = $WorkingDir + "Attachments.txt"
ni $temp1 -force -type "file"
$temp4 = "Diff.bat"
$temp5 = "ECHO F| XCOPY " + $AttachmentLocation
$temp6 = $workingDir + "Overnight\"

$temp3 = $TAttachments -replace "\\", "\\"

if ($TForms.length -gt 0) {
     foreach ($Form in $TForms)
     {
	     $temp = $TAttachments + $Form + "\*"
	     ls $temp -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp3",""} | ac $temp1
     }
}

$temp3 = $AAttachments -replace "\\", "\\"

if ($AForms.length -gt 0) {
     foreach ($Form in $AForms)
     {
	     $temp = $AAttachments + $Form + "\*"
	     ls $temp -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp3",""} | ac $temp1
     }
}

ni $temp4 -force -type "File"
$temp7 = Compare-Object $(Get-Content $Countyattachments) $(Get-Content $temp1) | Where-Object {$_.SideIndicator -eq '=>'} | %{$_ -replace "@{InputObject=",""} | %{$_ -replace "; SideIndicator==>}", ""} | %{$_ -replace "; SideIndicator=<=}", ""}


foreach ($file in $temp7)
{
     if ($file.substring(0,1) -eq 1) 
     {
	$temp8 = $temp5 + $TAttachments + $file + " " + $temp6 + $file + " /y" | ac $temp4
     }
     if ($file.substring(0,1) -ne 1)
     {
	$temp8 = $temp5 + $AAttachments + $file + " " + $temp6 + $file + " /y" | ac $temp4
     }
}


$temp10 = ".\" + $temp4
cmd /c $temp10

cd overnight

$temp9 = $temp6 + $County + "Catchup.rar"
$cmd = ".\..\RAR.exe  a -ep1 -r -y -x*.rar -x*.bak -x*.bat $temp9"

cmd /c $cmd

cd ..