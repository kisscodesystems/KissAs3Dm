# Runs the KissAs3Dm unit tests.
#
# > powershell -ExecutionPolicy Bypass -File .\KissAs3Dm_run_tests_windows.ps1
#
# This project holds two applications, so this script runs two test applications:
# - ApplicationUnitTestDemo is the ApplicationDemo itself, the demo application with the
#   three layers, the menu and the widgets of the framework
# - QuickUIUnitTestDemo is the QuickUIDemo itself, the reference application building one
#   of every component on one single screen
# Both of them are compiled against the current sources and run with adl. Every one of
# them builds the whole application under it, checks it, writes a report and quits.
#
# The exit code of this script is the first non zero exit code of the two runs.
#
# The run of the demo application builds every widget of it, one after the other, with
# every element of every one of them, so it takes minutes and its window stands frozen
# while it is working: that is the run doing its job, not a hanging one. The timeout below
# is the one telling those two apart.
#
# ! The demo application talks to its own servers while it starts: it asks the api of the
# active servers and it loads the background image of its displaying style. Both of those
# are answered in about a second, so nothing of them is left in flight by the time the run
# is over - but with no network at all those answers never arrive and the run can be left
# waiting for them, until the timeout below kills it.
#
# The path of the air sdk can be given in the AIRSDK environment variable.

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath (Join-Path $PSScriptRoot '..')
$root = (Get-Location).Path

# The folder of the air sdk. It can be given in the AIRSDK environment variable,
# otherwise it comes from .AIRSDK_HOME of the project root, and it is asked for
# once when there is no value stored there yet. See .\read_setting.ps1.
. (Join-Path $root 'read_setting.ps1')
$airsdk = if ($env:AIRSDK) { $env:AIRSDK } else { Read-Setting 'AIRSDK_HOME' 'the folder of the air sdk, for example C:\AIRSDK_51.2.1' }
# The framework the demo applications are built on is a project of its own,
# checked out next to this one: .KISSAS3FW_SRC points at the src folder of that
# checkout. It is asked for once, the same way the build asks for it.
$kissas3fwsrc = Read-Setting 'KISSAS3FW_SRC' 'the src folder of the KissAs3Fw checkout, for example C:\sources\KissAs3Fw\src'
$build = Join-Path $root 'build\testrun\as3dm'

# The two values every application of this project is built with, see
# build\scripts\windows\setup.ps1. The suites of one run work inside one single frame, so
# that limit of the execution is the one thing keeping the runtime from stopping them
# halfway through with an error of its own.
$swfFrameRate = 15
$swfScriptLimit = 1000

if (Test-Path -LiteralPath $build)
{
  Remove-Item -LiteralPath $build -Recurse -Force
}
New-Item -ItemType Directory -Path $build -Force | Out-Null

$firstExitCode = 0

# Compiles one test application, runs it and prints the report of it.
function Invoke-TestApplication
{
  param
  (
    # the name of the class of that application
    [string] $ClassName,
    # the width of the window it is run in
    [int] $Width,
    # the height of that window
    [int] $Height,
    # the name of the file it writes its report into
    [string] $ResultFileName,
    # the name of the descriptor it is run with
    [string] $DescriptorName
  )
  $swf = Join-Path $build "$ClassName.swf"
  $descriptor = Join-Path $build $DescriptorName
  $result = Join-Path $build $ResultFileName

  Write-Output ""
  Write-Output "Compiling $ClassName.."
  & (Join-Path $airsdk 'bin\mxmlc.bat') '+configname=air' `
    "-source-path=$kissas3fwsrc" "-source-path=$root\src" "-source-path=$root\test" `
    '-default-size' "$Width" "$Height" `
    '-default-frame-rate' "$swfFrameRate" `
    '-default-script-limits' "$swfScriptLimit" "$swfScriptLimit" `
    '-use-network' `
    "-output=$swf" `
    "$root\test\com\kisscodesystems\KissAs3Dm\$ClassName.as"
  if ($LASTEXITCODE -ne 0)
  {
    Write-Output "$ClassName could not be compiled."
    if ($script:firstExitCode -eq 0)
    {
      $script:firstExitCode = 1
    }
    return
  }

  # The descriptor has to sit next to the swf it points to. The application writes its
  # report next to that descriptor as well.
  Copy-Item -LiteralPath (Join-Path $root "test\$DescriptorName") -Destination $descriptor

  Write-Output ""
  Write-Output "Running $ClassName.."
  $adl = Start-Process -FilePath (Join-Path $airsdk 'bin\adl.exe') `
    -ArgumentList $descriptor -NoNewWindow -PassThru
  if (-not $adl.WaitForExit(600000))
  {
    $adl.Kill()
    Write-Output "$ClassName did not finish in 600 seconds, it has been killed."
  }
  $adlExit = $adl.ExitCode

  if (-not (Test-Path -LiteralPath $result))
  {
    Write-Output "No result file at $result, $ClassName did not run (adl exit code: $adlExit)."
    if ($script:firstExitCode -eq 0)
    {
      $script:firstExitCode = 1
    }
    return
  }

  Get-Content -LiteralPath $result
  if ($script:firstExitCode -eq 0)
  {
    $script:firstExitCode = $adlExit
  }
}

# The window of every application is the very one it is built for: the components take
# their places from the size of the stage, so a window of another size would place all of
# them somewhere else. See build\ApplicationDemo.xml and build\QuickUIDemo.xml, and the
# descriptors of these two runs in the test folder.
Invoke-TestApplication -ClassName 'ApplicationUnitTestDemo' -Width 1600 -Height 1000 `
  -ResultFileName 'KissAs3Dm-results.txt' -DescriptorName 'KissAs3Dm-app.xml'
Invoke-TestApplication -ClassName 'QuickUIUnitTestDemo' -Width 1682 -Height 1000 `
  -ResultFileName 'KissAs3DmQuickUI-results.txt' -DescriptorName 'KissAs3DmQuickUI-app.xml'

exit $firstExitCode
