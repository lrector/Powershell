$Clients = gc ClientList.txt

ni TestBatch.txt -force -type "file"

foreach ($Client in $Clients)
	{
		$Command = "DEL D:\Client\WA\" + $Client + "\Mapsifter\Website\Print\Images\*.jpg"
		$Command | ac TestBatch.bat
	}

.\TestBatch.bat > log.txt