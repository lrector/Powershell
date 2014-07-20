$Clients = GC ClientList.txt
$reportserver = "TerraT4"
$url = "http://$($reportserver)/reportserver/reportservice2005.asmx?WSDL"
$ssrs = New-WebServiceProxy -uri $url -UseDefaultCredential
# $proxyNamespace = $ssrs.GetType().Namespace

Foreach ($Client IN $Clients)
{
	$reports = $ssrs.ListChildren($Client, $false)
	Foreach ($Report IN $reports | where {$_.type -eq "Report"})
	{
		$reportPath = $Report.path
		$dataSources = $ssrs.GetItemDataSources($reportPath)
		Foreach ($dataSource IN $dataSources)
		{	
			$temp = $dataSource.name
			Write-host "Report: $reportPath, Data Source: $temp" 
			# $reportPath | ac DataSource.txt
			# $dataSource.name| ac DataSource.txt
			
		}	
	}
}
