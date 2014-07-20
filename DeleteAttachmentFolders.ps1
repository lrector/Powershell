# Get and delete all folders underneath the T2Resources\Overnight folder
# Edit paths to match server setup

dir c:\T2Resources\Overnight |
where-object {$_.PSIsContainer} |
%{$_.FullName} |
remove-item -recurse

# Get and delete all RAR and BAK files in the T2Resources\Overnight folder

dir c:\T2Resources\Overnight -include *.rar,*.bak -recurse |
remove-item -recurse

# Get and delete all RAR and BAK files in the T2Resources folder

dir c:\T2Resources -include *.rar,*.bak -recurse |
remove-item -recurse