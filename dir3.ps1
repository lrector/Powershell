
dir h:\powershelltest\test   | %{$_.FullName + " " + $_.LastWriteTime} 
dir h:\powershelltest\test2  | %{$_.FullName + " " + $_.LastWriteTime}
dir h:\powershelltest\test3  | %{$_.FullName} 
dir h:\powershelltest\test4  | %{$_.FullName} 

