dir h:\powershelltest |
where-object {$_.PSIsContainer} |
%{$_.FullName} |
remove-item -recurse

dir h:\powershelltest -include *.rar,*.bak -recurse |
remove-item -recurse

