[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
$computer = [Microsoft.VisualBasic.Interaction]::InputBox("Enter a computer name", "Computer", "$env:computername")

[Microsoft.VisualBasic.Interaction]::MsgBox("$Computer", 0,"This is a message box")