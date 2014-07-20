ni h:\powershelltest\dir.txt -force -type "file"
dir h:\powershelltest\test   | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac h:\powershelltest\dir.txt
dir h:\powershelltest\test2  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac h:\powershelltest\dir.txt
dir h:\powershelltest\test3  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac h:\powershelltest\dir.txt
dir h:\powershelltest\test4  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac h:\powershelltest\dir.txt

