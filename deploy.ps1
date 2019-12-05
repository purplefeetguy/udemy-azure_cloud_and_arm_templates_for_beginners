

$MsDeployPackageUrl="https://pfldemodeploy.blob.core.windows.net/pfldemodeploy/aspnetcoreapp.zip?sp=r&st=2019-12-05T12:34:57Z&se=2020-12-05T20:34:57Z&spr=https&sv=2019-02-02&sr=b&sig=PrW4vndgGHhFa%2Fkp97sUtB2MDjE5m31dOHM9vYbnTEk%3D"
$extraparams = New-Object -TypeName Hashtable
$extraparams.Add('MsDeployPackageUrl',$MsDeployPackageUrl)

Login-AzureRmAccount

Select-AzureRmContext 'Visual Studio Enterprise with MSDN (0b55b4c7-3322-4eb8-988a-0cda8f823217) - purplefeetguy@hotmail.com'

New-AzureRmResourceGroup -Name "PFLTestGroup" -Location "northcentralus"

New-AzureRmResourceGroupDeployment -Name "aspnetcore" -ResourceGroupName "PFLTestGroup" -TemplateFile "template.json" -TemplateParameterObject $extraparams -Verbose
