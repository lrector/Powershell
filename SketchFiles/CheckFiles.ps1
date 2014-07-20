$DB = "GrantWA"
$Server = "TerraT4"
$Path = "h:\powershelltest\sketchfiles\filelist.txt"

$Attachments = Invoke-SQLCmd -query "
SELECT		f.AURL, p.ParcelNumber
FROM		$DB..tTS_File f
INNER JOIN	$DB..tAA_Parcel p ON p.ParcelID = f.KeyID
WHERE		f.IsDeleted = 0
AND		f.Form = 30000
AND		f.FileTypeID = 2
AND		f.PFileID = 0
AND		f.AURL IS NOT NULL" -ServerInstance $Server

New-Item $Path -force -type "file"
Add-Content $Path "Parcel    Test  Path"
Add-Content $Path "--------------------------------------------------------------------------------"

ForEach ($File in $Attachments)
{
	$FilePath = $File["AURL"].ToString() 
	$FileTest = Test-Path $File
	$Parcel = $File["ParcelNumber"].ToString()

	$Parcel + " " + $FileTest + " " + $FilePath  | Add-Content $Path
}
