CLS
$Row = 0
$Column = 0
$Rows = 10
$Columns = 10
$Level = 10
$Levels = 5
$Client = "Lincoln"
#Eventually turn these into parameters
$N = 5034437.110
$S = 4934810.063
$W = -10832184.687
$E = -10676965.992

$YInterval = ($N - $S) / $Rows
$XInterval = ($W - $E) / $Columns
$XOffset = $XInterval * .025
$YOffset = $YInterval * .025

$Rows--
$Columns--

$Script = get-content ScriptSource.txt

WHILE ($Row -le $Rows)
{
	WHILE ($Column -le $Columns)
	{
		$Y1 = $N - ($YInterval * $Row) + $YOffset
		$Y2 = $N - ($YInterval * ($Row + 1)) - $YOffset
		$X1 = $W - ($XInterval * $Column) + $XOffset
		$X2 = $W - ($XInterval * ($Column + 1)) - $XOffset
		
		$CellScript = $Script + "EXPORT_WEB FILENAME=`"f:\Tiles\$Client\L$Level-R$Row-C$Column\map.htm`" TYPE=VIRTUAL_EARTH MAX_ZOOM_LEVEL=$Level NUM_ZOOM_LEVELS=$Level IMAGE_FORMAT=JPG GLOBAL_BOUNDS=`"$X1,$Y1,$X2,$Y2`""
		
		$SlurpCmd = "globalmappertoquadtree -from F:\Tiles\$Client\L$Level-R$Row-C$Column\ -to e:\Tiles\NE\$Client\20140808_L$Level-R$Row-C$Column\ -m -s"
		
		$Batch = "`"C:\Program Files\GlobalMapper15_64bit\global_mapper.exe`" `"D:\working\$Client\Script$Client-L$Level-$Row-$Column.gms`""
		
		ac Script$Client-L$Level-$Row-$Column.gms $CellScript
		
		ac Slurp$Client-L$Level-$Row-$Column.cmd $SlurpCmd
		
		ac Batch$Client-L$Level-$Row-$Column.bat $Batch
		
		$Column++
	}
	$Column = 0
	$Row++
}