##########################################################
# Test-Site - script to test web site availability
# and notify in case of any issues
# (c) Dmitry Sotnikov
# http://dmitrysotnikov.wordpress.com
##########################################################

function Test-Site {
    param($URL)
    trap{
        "Failed. Details: $($_.Exception)"
        $emailFrom = "lrector@gmail.com"
        # Use commas for multiple addresses
        $emailTo = "lance.rector@thomsonreuters.com"
        $subject = "$URL Mapsifter down"
        $body = "$URL Mapsifter web site is down. Details: $($_.Exception)"
        $smtpServer = "smtp.gmail.com"
        $smtp = new-object Net.Mail.SmtpClient($smtpServer, 587)
	$smtp.EnableSsl = $true
	$smtp.Credentials = New-Object System.Net.NetworkCredential("lrector", "foxyboy");
        $smtp.Send($emailFrom, $emailTo, $subject, $body)    
        continue;
    }
    $webclient = New-Object Net.WebClient
    
    # This is the main call
    $webclient.DownloadString($URL) | Out-Null
} 

$ClientList = get-content g:\powershelltest\websitecheck\clientlist.txt

foreach ($Client in $ClientList)
{
	Test-Site $Client
	$Client
}

