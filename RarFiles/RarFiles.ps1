#Create individual RAR archives for files in a specified folder

param([string]$Folder = "Folder Path", [string]$Options = " -ep1")

$Files = ls $Folder | where {!$_.PSIsContainer} | %{$_.FullName}

$options = $Options + " -ep1"

foreach ($File in $Files)
{
	$FileName = $File.ToString()
	$RarName = $FileName.substring(0,$FileName.Length-4) + ".rar"
	.\rar.exe a $RarName $FileName -ep1
}