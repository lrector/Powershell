ls  -recurse -include *.jpg | %{$_.PSChildName} | ac dir.txt