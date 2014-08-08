CLS
$Row = 0
$Column = 0
$Rows = 4
$Columns = 4
#Eventually turn these into parameters
$N = 4981404.01594639
$S = 4957536.33179067
$W = -11048473.93326050
$E = -11007444.45903070

$XInterval = ($N - $S) / $Rows
$YInterval = ($W - $E) / $Columns
$XOffset = $XInterval * .025
$YOffset = $YInterval * .025

$Rows--
$Columns--

$Script = get-content ScriptSource.txt

WHILE ($Row -le $Rows)
{
	WHILE ($Column -le $Columns)
	{
		$X1 = $N - ($XInterval * $Row) + $XOffset
		$X2 = $N - ($XInterval * ($Row + 1)) - $XOffset
		$Y1 = $W - ($YInterval * $Column) + $YOffset
		$Y2 = $W - ($YInterval * ($Column + 1)) - $YOffset
		
		$CellScript = $Script + "EXPORT_WEB FILENAME=`"f:\Tiles\Kearney01\R$Row-C$Column\map.htm`" TYPE=VIRTUAL_EARTH MAX_ZOOM_LEVEL=20 NUM_ZOOM_LEVELS=1 IMAGE_FORMAT=JPG GLOBAL_BOUNDS=`"$X1,$Y1,$X2,$Y2`""
		
		ac L20KearneyScript$Row-$Column.gms $CellScript
		
		$Column++
	}
	$Column = 0
	$Row++
}