$Msg = Get-Content Output.txt

$notificationPayload = @{ channel="#incoming"; text=”@miraclemitch - Nutshell Import: $Msg”; username=”Powershell”;}
Invoke-RestMethod -Uri “https://hooks.slack.com/services/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” -Method Post -Body (ConvertTo-Json $notificationPayload)
