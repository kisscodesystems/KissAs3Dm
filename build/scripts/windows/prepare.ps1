# The application to build is the first argument of this script.
param([string]$AS3_CLASSNAME)

. "$PSScriptRoot\setup.ps1" $AS3_CLASSNAME

Write-Output " "
Get-Date
Write-Output "Building your $AS3_CLASSNAME airsdk project.."
Write-Output " "
Write-Output "JAVA: $JAVA"
Write-Output "AIRSDK_HOME: $AIRSDK_HOME"
Write-Output " "
Write-Output "The location of your final app will be"
Write-Output $APPLICATION_FULL
Write-Output "You can zip it or create an installer from it if you want."
Write-Output " "
Write-Output "   ______________ "
Write-Output "  +--------------+"
Write-Output "  : Making swf   : $OUTPUT_FULLPATH"
Write-Output "  +--------------+"
Write-Output "  : From         : $AS3_FILEPATH"
Write-Output "  : With bgcolor : $SWF_BACKGROUND_COLOR"
Write-Output "  : With width   : $SWF_WIDTH"
Write-Output "  : With height  : $SWF_HEIGHT"
Write-Output "  +--------------+"

if (Test-Path -LiteralPath $OUTPUT_FULLPATH)
{
  Remove-Item -LiteralPath $OUTPUT_FULLPATH -Force
}

Copy-Item -LiteralPath "$PSScriptRoot\..\..\icons" -Destination "$AIRSDK_HOME\bin" -Recurse -Force
Copy-Item -LiteralPath "$PSScriptRoot\..\..\$XML_FILENAME" -Destination "$AIRSDK_HOME\bin" -Force
New-Item -ItemType Directory -Path "$AIRSDK_HOME\bin\certs" -Force | Out-Null
