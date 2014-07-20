ni "H:\PowerShellTest\Catchup Attachments\test.txt" -force -type "File"

$temp3 = "H:\\Powershelltest\\"

ls H:\Powershelltest\ -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "$temp3",""} | ac test.txt
