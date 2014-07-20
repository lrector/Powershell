ni "dir.lst" -force -type "File"

$Files = dir -recurse -include *.jpg -exclude *_s.jpg, *_m.jpg | WHERE {!$_.PSIsContainer} | %{$_.FullName -replace ".jpg",""}

$Thumbs = dir -recurse -include *_s.jpg | WHERE {!$_.PSIsContainer} | %{$_.FullName -replace "_s.jpg",""} 

Compare-Object $Files $Thumbs  | %{$_ -replace "@{InputObject=",""} | %{$_ -replace "; SideIndicator==>}", ".jpg"} | %{$_ -replace "; SideIndicator=<=}", ".jpg"} | ac "dir.lst"

.\ezthumbs.bat