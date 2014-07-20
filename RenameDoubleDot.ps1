$Files = dir -recurse | where {$_.FullName -like "*..???"} 

foreach ($File in $Files)
	{
	$File.Fullname
	$NewName = $File.FullName -replace "\.\.", "."
	rename-item $File.FullName $NewName
	$NewName
	}