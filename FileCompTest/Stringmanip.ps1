[StringSplitOptions]$option = "None"
[string[]]$separator = "\attachments\"
$File = "stevensattachments.txt"
foreach($Filename in (Get-Content $File))
{
ac "StevensAtt.txt" @($Filename.Split($separator, $option))
} 
