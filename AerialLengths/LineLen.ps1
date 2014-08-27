cls

$Dir = "dir.txt"

if(test-path ($Dir))
{
	$Files = gc dir.txt
	Write-Host "Reading File"
}
else
{
	$Files = ls  -recurse -include *.jpg | %{$_.PSChildName} | ac dir.txt
	Write-Host "Creating File"
	$Files = gc dir.txt
}

$Lines = New-Object System.Collections.Generic.List[System.String]

foreach ($File in $Files)
{
	$Lines.Add($File.length -1)
}

$List = $Lines.ToArray()

$List2 = $List | select -uniq

$List2 | measure -minimum -maximum

$List | measure

