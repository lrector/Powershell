CLS
#Make these arguments to be passed in
$N = 50000
$S = 10000
$W = -50000
$E = -10000

$NSDiff = $N - $S
$EWDiff = $E - $W
$NSOff = $NSDiff * .025
$EWOff = $EWDiff * .025

#Result should be 9 sets of 4 coordinates.
$N1 = $N - $NSDiff/3
$W1 = $W + $EWDiff/3

$N2 = $N1 - $NSDiff/3
$W2 = $W1 + $EWDiff/3


#$NSDiff
#$EWDiff

#First Row
#First Box
Write-Host "----"
$N + $NSOFf
$W - $EWOff
$N1 - $NSOff
$W1 + $EWOff
Write-Host "----"
#Second Box
$N + $NSOFf
$W1 - $EWOff
$N1 - $NSOff
$W2 + $EWOff
Write-Host "----"
#Third Box
$N + $NSOFf
$W2 - $EWOff
$N1 - $NSOff
$E + $EWOff

#Second Row
#First Box
Write-Host "----"
$N1 + $NSOFf
$W - $EWOff
$N2 - $NSOff
$W1 + $EWOff
Write-Host "----"
#Second Box
$N1 + $NSOFf
$W1 - $EWOff
$N2 - $NSOff
$W2 + $EWOff
Write-Host "----"
#Third Box
$N1 + $NSOFf
$W2 - $EWOff
$N2 - $NSOff
$E + $EWOff

#Third Row
#First Box
Write-Host "----"
$N2 + $NSOFf
$W - $EWOff
$S - $NSOff
$W1 + $EWOff
Write-Host "----"
#Second Box
$N2 + $NSOFf
$W1 - $EWOff
$S - $NSOff
$W2 + $EWOff
Write-Host "----"
#Third Box
$N2 + $NSOFf
$W2 - $EWOff
$S - $NSOff
$E + $EWOff