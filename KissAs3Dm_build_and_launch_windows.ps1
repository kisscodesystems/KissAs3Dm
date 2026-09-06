# To build this project, you are going to need the following tools:
# - java jre or jdk installed or unzipped
# - airsdk installed or unzipped
# This will build your project as a bundle for Windows users.
#
# > powershell -ExecutionPolicy Bypass -File .\KissAs3Dm_build_and_launch_windows.ps1

# Go to .\build\scripts\windows\setup.ps1 and specify the aboves!

# The class name of the demo application to build is the first argument of this
# script, the ApplicationDemo is built when there is no argument at all:
# > powershell -ExecutionPolicy Bypass -File .\KissAs3Dm_build_and_launch_windows.ps1
# > powershell -ExecutionPolicy Bypass -File .\KissAs3Dm_build_and_launch_windows.ps1 QuickUIDemo
param([string]$AS3_CLASSNAME)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

# The steps abort the whole build with a non zero exit code when they fail, so
# the exit code is cleared before every one of them and checked after it.
function Invoke-Step([string]$Step)
{
  $global:LASTEXITCODE = 0
  & "$PSScriptRoot\build\scripts\windows\$Step.ps1" $AS3_CLASSNAME
  if ($global:LASTEXITCODE -ne 0)
  {
    exit $global:LASTEXITCODE
  }
  Set-Location -LiteralPath $PSScriptRoot
}

Invoke-Step 'setup'
Invoke-Step 'prepare'
Invoke-Step 'build_app'
Invoke-Step 'create_cert'
Invoke-Step 'create_app'
Invoke-Step 'launch_app'
