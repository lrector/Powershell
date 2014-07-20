$license = new-webserviceproxy -uri http://terrat4/mvp/residential/scengine.asmx?wsdl

$license.GetLicenseDetails -list