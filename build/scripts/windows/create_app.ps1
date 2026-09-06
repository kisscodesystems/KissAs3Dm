# The application to build is the first argument of this script.
param([string]$AS3_CLASSNAME)

. "$PSScriptRoot\setup.ps1" $AS3_CLASSNAME

Write-Output " "
Write-Output "Creating your final app package with adt.."

Push-Location "$AIRSDK_HOME\bin"
if (Test-Path -LiteralPath $APPLICATION_NAME)
{
  Remove-Item -LiteralPath $APPLICATION_NAME -Recurse -Force
}
& '.\adt.bat' `
  -licenseFile $LICENSE_FILE `
  -package `
  -storetype pkcs12 `
  -keystore "certs\$AS3_CERTNAME" `
  -storepass $KEYSTORE_PASS `
  -target bundle `
  $APPLICATION_NAME `
  $XML_FILENAME `
  $OUTPUT_FILENAME `
  icons
$adtExit = $LASTEXITCODE
Pop-Location
if ($adtExit -ne 0)
{
  Write-Output "The app package could not be created."
  exit 1
}
