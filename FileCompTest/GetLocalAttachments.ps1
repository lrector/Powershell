#Not ready for primetime!
ni d:\client\wa\grant\incoming\GrantAttachments.txt -force -type "file"
ls d:\client\wa\grant\attachments\* -recurse -Exclude *.rar |where {!$_.PSIsContainer} | %{$_.FullName -replace "d:\\Client\\wa\\grant\\attachments\\",""} | ac d:\client\wa\grant\incoming\GrantAttachments.txt
