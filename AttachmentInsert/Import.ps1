
$Files = ls -recurse "H:\IN\Speedway\20151112_ManholePhotos\Panoramo Film Files" |
	where {!$_.PSIsContainer} | %{$_.PSChildName}
	#|	%{$_.FullName -replace "H:\\IN\\Speedway\\20151112_ManholePhotos\\Panoramo Film Files",""}
$Files
<#
foreach ($File in $Files)
	{
		$FileName = $File.ChildName
		$FileName
	}
#>
