#* ======================
#* Alert Me Script
#* ======================
#* Create Email Function
#* ======================
function sendEmail {

#* Create new .NET object and assign to variable
$mail = New-Object System.Net.Mail.MailMessage

#* Sender Address
$mail.From = New-Object System.Net.MailAddress("lancer@terrascan.com");

#* Recipient Address
$mail.To.Add("lancer@terrascan.com");

#* Message Subject
$mail.Subject = "Place Subject of email here";

#* Message Body
$mail.Body = "Place body content here";

#* Connect to your mail server
$smtp = New-Object System.Net.Mail.SmtpClient("mail.terrascan.com");

#* Uncomment line below if authentication is required
#* $smtp.Credentials = New-Object System.Net.NetworkCredential("", "");

#* Send Email
$smtp.Send($mail);

}

#* =====================
#* Script Body
#* =====================


{sendEmail}