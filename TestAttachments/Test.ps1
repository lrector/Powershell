ni "E:\GitHub\Powershell\TestAttachments\Results.txt" /force  -type "file"

. "E:\GitHub\Powershell\TestAttachments\test_uri.ps1"



gc Test.txt | test-uri -Detail | where { $_.status -ne 200 } | ac Results.txt