$db = "T2Query"
$server = "TerraT4"
$File = "c:\temp\RowCount.txt"

$ExternalCheck = Invoke-SqlCmd -query "
SELECT	 GETDATE() as DateStamp
		,COUNT(*) as Rows
FROM	$db..tQA_SalesRatio3
" -ServerInstance $Server

$ExternalCheck.DateStamp.ToString() + " " + $ExternalCheck.Rows.ToString() | ac $File