# The application to build is the first argument of this script.
param([string]$AS3_CLASSNAME)

. "$PSScriptRoot\setup.ps1" $AS3_CLASSNAME

Write-Output " "
if (Test-Path -LiteralPath "$AIRSDK_HOME\bin\certs\$AS3_CERTNAME")
{
  Write-Output "Your certificate has been created before."
}
else
{
  Write-Output "Creating your self signed certificate right now."
  Push-Location "$AIRSDK_HOME\bin"
  & '.\adt.bat' `
    -certificate `
    -cn selfsigned `
    -ou orgUnit `
    -o orgName `
    -c HU `
    -validityPeriod 1 `
    2048-RSA `
    "certs\$AS3_CERTNAME" `
    $KEYSTORE_PASS
  Pop-Location
}
