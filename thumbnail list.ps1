ni d:\installs\franklinwa\attachments\Thumbnails.txt -force -type "file"
dir -recurse -include *_s.jpg,*_m.jpg | %{$_.FullName} | ac d:\installs\franklinwa\attachments\Thumbnails.txt