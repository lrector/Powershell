Get-ChildItem H:\PowershellTest -Recurse -Force |
	Where {$_.PSIsContainer} |
	Sort-Object FullName -Descending |
	Where {!(Get-ChildItem $_.FullName -Force)} |
	Remove-Item


