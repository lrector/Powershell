

gc Test.txt | test-uri -Detail | where { $_.status -ne 200 } | ac Results.txt