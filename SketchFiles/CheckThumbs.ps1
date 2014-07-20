$DB = "T2App"
$Server = "black"
$Path = "d:\t2resources\filelist.txt"
$Path2 = "d:\t2resources\fileids.txt"

$Attachments = Invoke-SQLCmd -query "
SELECT		f.AURL,f.FileID
FROM		$DB..tTS_File f
WHERE		f.IsDeleted = 0
AND		f.Form = 30000
AND		f.FileTypeID = 2
AND		f.AURL IS NOT NULL
AND		f.InsertedBy <> 1
ORDER BY	f.fileid
" -ServerInstance $Server

New-Item $Path -force -type "file"
New-Item $Path2 -force -type "file"

ForEach ($File in $Attachments)
{
	$FilePath = $File["AURL"].ToString() 
	$MedThumb = $FilePath | %{$_ -replace ".jpg", "_m.jpg"}
	$FileID = $File["FileID"]
	switch(Test-Path $MedThumb)
	{
		"False"{
				$FilePath | Add-Content $Path
				$FileID | Add-Content $Path2
			}
	}
}
