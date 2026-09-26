# The application to build is the first argument of this script.
param([string]$AS3_CLASSNAME)

. "$PSScriptRoot\setup.ps1" $AS3_CLASSNAME

Write-Output " "
Write-Output "Building your swf file first.."
# Every switch of the compiler is quoted: powershell cuts an unquoted one in two
# at the dot in it - the compiler would be given -compiler and .source-path
# instead of -compiler.source-path - and it reads an unquoted 0xffffff as a
# number. Quoted, every one of them is handed over exactly as it is written here.
& $JAVA -jar "$AIRSDK_HOME\lib\mxmlc-cli.jar" `
  '-load-config' "$AIRSDK_HOME\frameworks\air-config.xml" `
  '+flexlib' "$AIRSDK_HOME\frameworks" `
  '+configname=air' `
  '-debug=false' `
  '-use-network' `
  '-warnings' `
  '-default-background-color' "$SWF_BACKGROUND_COLOR" `
  '-default-frame-rate' "$SWF_FRAME_RATE" `
  '-default-script-limits' "$SWF_SCRIPT_LIMIT" "$SWF_SCRIPT_LIMIT" `
  '-default-size' "$SWF_WIDTH" "$SWF_HEIGHT" `
  '-compiler.source-path' "$KISSAS3FW_SRC" "$AS3_SRC" `
  '-o' "$OUTPUT_FULLPATH" `
  '-file-specs' "$AS3_FILEPATH"
if ($LASTEXITCODE -ne 0)
{
  Write-Output "The swf could not be built."
  exit 1
}
