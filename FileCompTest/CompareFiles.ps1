$AttachmentLocation = "D:\TerraScanRef\Attachment\"
$TAttachments = $AttachmentLocation + "1\"
$AAttachments = $AttachmentLocation + "2\"
$WorkingDirectory = "D:\T2Resources\"
$temp1 = $WorkingDirectory + "Attachments.txt"
$tempa1 = $TAttachments + "11010\*"
$tempa2 = $TAttachments + "11011\*"
$tempa3 = $TAttachments + "11001\*"
$tempa4 = $AAttachments + "30000\"
$temp3 = $AttachmentLocation -replace "\\", "\\"
$temp4 = $WorkingDirectory + "Diff.bat"
$temp5 = "ECHO F| XCOPY " + $AttachmentLocation
$temp6 = $workingDirectory + "Overnight\"

ftp "-s:StevensFtpHostList.txt"

ni $temp1 -force -type "file"

ls $tempa1 -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp3",""} | ac $temp1
ls $tempa2 -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp3",""} | ac $temp1
ls $tempa3 -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp3",""} | ac $temp1

ni $temp4 -force -type "File"
$temp7 = Compare-Object $(Get-Content stevensattachments.txt) $(Get-Content $temp1) | Where-Object {$_.SideIndicator -eq '=>'} | %{$_ -replace "@{InputObject=",""} | %{$_ -replace "; SideIndicator==>}", ""} | %{$_ -replace "; SideIndicator=<=}", ""}

foreach ($file in $temp7)
{
$temp8 = $temp5 + $file + " " + $temp6 + $file + " /y" | ac $temp4
}

