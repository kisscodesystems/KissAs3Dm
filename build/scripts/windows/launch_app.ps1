# The application to build is the first argument of this script.
param([string]$AS3_CLASSNAME)

. "$PSScriptRoot\setup.ps1" $AS3_CLASSNAME

Write-Output " "
# adt packages a folder with an exe in it on windows, that exe is the application.
Write-Output "We will launch it for you by:"
Write-Output "$APPLICATION_FULL\$APPLICATION_EXECUTABLE"
Push-Location $APPLICATION_FULL
& ".\$APPLICATION_EXECUTABLE"
Pop-Location
