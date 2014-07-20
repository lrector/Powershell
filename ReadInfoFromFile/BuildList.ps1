$Data = gc info.ini 
$County = $Data[1]
$User = $Data[2]
$Pass = $Data[3]
$DB = $Data[7]
$TForms = $Data[12..21] | where {$_ -ne ""}
$AForms = $Data[24..33] | where {$_ -ne ""}

$Name = $County + "host.txt"

ni $name -force -type "file"

ac $name "OPEN ftp.taxsifter.com"
ac $name "$User"
ac $name "$Pass"
ac $name "ls"
ac $name "quit"

$temp1 = "H:\PowershellTest\FileCOmpTest\test.txt"
$temp2 = "H:\PowershellTest\01\"
$temp2 = $temp2 -replace "\\", "\\"
ni $temp1 -force -type "file"

foreach ($Form in $TForms)
{
	$temp = "h:\powershelltest\01\" + $Form
	ls $temp -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp2",""} | ac $temp1
}

$temp2 = "H:\PowershellTest\02\"
$temp2 = $temp2 -replace "\\", "\\"

foreach ($Form in $AForms)
{
	$temp = "h:\powershelltest\02\" + $Form
	ls $temp -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp2",""} | ac $temp1
}

