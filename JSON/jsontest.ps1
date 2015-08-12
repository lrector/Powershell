$json = @'
{
   "jsonrpc" : "2.0",
   "method" : "getApiForUsername",
   "params" : {
      "username" : "lrector@beehiveindustries.com"
   },
   "id" : "apeye"
}
'@

 
$Object = ConvertFrom-Json -InputObject $json

$Object



   # "jsonrpc" : "2.0",
   # "method" : "getApiForUsername",
   # "params" : {
      # "username" : "lrector@beehiveindustries.com"
	# }
   # "id" : "apeye"