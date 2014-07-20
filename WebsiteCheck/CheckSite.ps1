$emailFrom = "lrector@gmail.com"
$emailTo = "lance.rector@thomsonreuters.com"
$subject = "Test"
$body = "This is a test"
$smtpServer = "smtp.gmail.com"
$smtp = new-object Net.Mail.SmtpClient($smtpServer, 587)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential("", "");
$smtp.Send($emailFrom, $emailTo, $subject, $body) 