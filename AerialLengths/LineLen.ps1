cls

$Files = ls  -recurse -include *.jpg | %{$_.PSChildName} | ac dir.txt
$Count = 0
$Lines = New-Object System.Collections.Generic.List[System.String]

foreach ($File in $Files)
{
	$Lines.Add($File.length -1)
}

$List = $Lines.ToArray()

$List2 = $List | select -uniq

$List2 | measure -minimum -maximum

$List | measure