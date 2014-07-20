$EmailFrom = "lrector@gmail.com"
$EmailTo = "lance.rector@thomsonreuters.com"
$Subject = "Test"
$Body = "Testing Email From Powershell"
$SMTPServer = "smtp.gmail.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("", "");
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
