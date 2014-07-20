$File = "H:\Powershelltest\DirRemove.txt"

#ni $File -force -type "file"

$Dirs = 
	dir -recurse | 
	Where-Object { $_.PSIsContainer } |
	Sort-Object FullName-Descending |
	#Where-Object { $_.GetFiles().Count -eq 0 } |
	#Where-Object { $_.GetDirectories().Count -eq 0 } |
	ForEach-Object { $_.FullName }

$temp = "Directories to remove from server"
$temp | ac $File
$i = 0

Foreach ($Dir in $Dirs) 
	{
		$Dir |
		Where-Object {$_.GetFiles().Count -eq 0} |
		Where_Object {$_.GetDirectories().Count -eq 0} |
		ac $File
		$Dir |
		Where-Object {$_.GetFiles().Count -eq 0} |
		Where_Object {$_.GetDirectories().Count -eq 0} |
		remove-item
		$i ++
	}

$temp = "$i Directories removed"
$temp | ac $File
