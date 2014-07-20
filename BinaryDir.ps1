ni d:\client\wa\Report\Received.txt -force -type "file"
ac d:\client\wa\Report\Received.txt -value "Grant County"
ls d:\client\wa\Grant\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Kittitas County"
ls d:\client\wa\Kittitas\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Lincoln County"
ls d:\client\wa\Lincoln\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Okanogan County"
ls d:\client\wa\Okanogan\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Pacific County"
ls d:\client\wa\Pacific\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Skamania County"
ls d:\client\wa\Skamania\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"}  | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Stevens County"
ls d:\client\wa\Stevens\incoming  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
ac d:\client\wa\Report\Received.txt -value "Walla Walla County"
ls "d:\client\wa\Walla Walla\incoming"  | %{$_.FullName + " " + $_.LastWriteTime + "`n"} | ac d:\client\wa\Report\Received.txt
