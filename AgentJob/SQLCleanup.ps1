$DB = "GrantWA"
$Server = "TerraT4"

$T2Resources = Invoke-SqlCmd -query "SELECT CfgValue FROM $DB..tTS_Cfg WHERE CfgName = 'TR_ExciseWebBatchPath'" -ServerInstance $Server

$T2ResourcesPath = $T2Resources["CfgValue"].ToString() | %{$_ -replace "\\Overnight\\", ""}

$T2OvernightPath = $T2Resources["CfgValue"].ToString()

# Get and delete all folders underneath the T2Resources\Overnight folder
dir $T2OvernightPath | 
where-object {$_.PSIsContainer} |
%{$_.FullName} |
remove-item -recurse

# Get and delete all RAR and BAK files in and under the T2Resources folder
dir $T2resourcesPath -include *.rar,*.bak -exclude catchup.rar -recurse |
remove-item -recurse