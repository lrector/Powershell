$db = "t2exciseonline"
$server = "terraweb"

ni d:\terrascan\test\missingreet.txt -force -type "file"

$REET = Invoke-SqlCmd -query "
SELECT   CONVERT(VARCHAR,f.Form) + '\' 
   + CONVERT(VARCHAR,LEFT(f.FILEid,3)) 
   + '\' + CONVERT(VARCHAR,RIGHT(f.fileid,3)) 
   + '\' + CONVERT(VARCHAR,f.fileID)
   + f.Extension AS AURL
FROM  $db..tts_File f
INNER JOIN $db..ttr_Statement s ON s.statementid = f.KeyID
    AND s.IsDeleted = 0
    AND f.IsDeleted = 0
    AND s.PostTypeID = 4
    AND f.AURL IS NOT NULL
    AND f.ispublic = 1
" -ServerInstance $Server

foreach ($Attach in $REET)
{
	$Path = "c:\inetpub\wwwroot\reetsifter\" + $Attach.AURL
	$Result = "ECHO F| XCOPY E:\TSattachments\TRattachments\" + $Attach.AURL + " E:\T2Resources\Overnight\Catchup\" + $Attach.AURL + " /Y"
	switch(Test-Path $Path)
	{
   		"False"{$Result | ac d:\terrascan\test\missingreet.txt}
  	}
}
