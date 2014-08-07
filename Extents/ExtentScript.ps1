CLS
$Row = 0
$Column = 0
$N = 4981404.01594639
$S = 4957536.33179067
$W = -11048473.93326050
$E = -11007444.45903070

$XInterval = ($N - $S) / 3
$YInterval = ($W - $E) / 3
$XOffset = $XInterval * .025
$YOffset = $YInterval * .025

$Script = get-content ScriptSource.txt

WHILE ($Row -le 2)
{
	WHILE ($Column -le 2)
	{
		$X1 = $N - ($XInterval * $Row) + $XOffset
		$X2 = $N - ($XInterval * ($Row + 1)) - $XOffset
		$Y1 = $W - ($YInterval * $Column) + $YOffset
		$Y2 = $W - ($YInterval * ($Column + 1)) - $YOffset
		
		$CellScript = $Script + "EXPORT_WEB FILENAME=`"R$Row-C$Column.htm`" TYPE=VIRTUAL_EARTH MAX_ZOOM_LEVEL=10 NUM_ZOOM_LEVELS=5 IMAGE_FORMAT=JPG GLOBAL_BOUNDS=`"$X1,$Y1,$X2,$Y2`""
		
		ac Script$Row-$Column.gms $CellScript
		
		$Column++
	}
	$Column = 0
	$Row++
}