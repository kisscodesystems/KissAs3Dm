# The application to build is the first argument of this script. It is passed
# down by KissAs3Dm_build_and_launch_windows.ps1, and the ApplicationDemo gets
# built when there is no argument at all.
param([string]$AS3_CLASSNAME)

# The location of these tools and files on your computer. Leave every one of
# them empty: they are asked for once and stored in the project root, in .JAVA,
# .AIRSDK_HOME, .KISSAS3FW_SRC and .LICENSE_FILE. See .\read_setting.ps1 about
# them. Filling one of them in here makes that value the one being used.
$JAVA = ''
$AIRSDK_HOME = ''
$KISSAS3FW_SRC = ''
$LICENSE_FILE = ''
# For example
# $JAVA = 'C:\Program Files\Java\jdk-21\bin\java.exe'
# $AIRSDK_HOME = 'C:\AIRSDK_51.2.1'
# $KISSAS3FW_SRC = 'C:\sources\KissAs3Fw\src'
# $LICENSE_FILE = 'C:\adt.lic'

. "$PSScriptRoot\..\..\..\read_setting.ps1"
if ($JAVA -eq '')
{
  $JAVA = Read-Setting 'JAVA' 'the java executable, for example C:\Program Files\Java\jdk-21\bin\java.exe'
}
if ($AIRSDK_HOME -eq '')
{
  $AIRSDK_HOME = Read-Setting 'AIRSDK_HOME' 'the folder of the air sdk, for example C:\AIRSDK_51.2.1'
}
if ($KISSAS3FW_SRC -eq '')
{
  $KISSAS3FW_SRC = Read-Setting 'KISSAS3FW_SRC' 'the src folder of the KissAs3Fw checkout, for example C:\sources\KissAs3Fw\src'
}
if ($LICENSE_FILE -eq '')
{
  $LICENSE_FILE = Read-Setting 'LICENSE_FILE' 'the license file of harman, for example C:\adt.lic'
}

# Specify your project specific values:
$SWF_BACKGROUND_COLOR = '0xffffff'
$SWF_FRAME_RATE = '15'
$SWF_HEIGHT = '1000'
$SWF_SCRIPT_LIMIT = '1000'
$KEYSTORE_PASS = 'asdfasdf'
if ([string]::IsNullOrEmpty($AS3_CLASSNAME))
{
  $AS3_CLASSNAME = 'ApplicationDemo'
}
# The size of the swf has to be the same as the window size in the descriptor
# of the app: build\$AS3_CLASSNAME.xml
switch -CaseSensitive ($AS3_CLASSNAME)
{
  'ApplicationDemo'
  {
    $SWF_WIDTH = '1600'
  }
  'QuickUIDemo'
  {
    $SWF_WIDTH = '1682'
  }
  default
  {
    Write-Output "There is no application called $AS3_CLASSNAME!"
    Write-Output "The available ones are: ApplicationDemo QuickUIDemo"
    exit 5
  }
}

# Other values you don't need to change
# The demo applications are in this project, the framework they are built on is
# a project of its own, checked out next to this one: KISSAS3FW_SRC points at
# the src folder of that checkout and both folders are on the source path of
# the compiler.
$AS3_SRC = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..\..\src')).Path
$AS3_FILEPATH = "$AS3_SRC\com\kisscodesystems\KissAs3Dm\$AS3_CLASSNAME.as"
$OUTPUT_FILENAME = "$AS3_CLASSNAME.swf"
$XML_FILENAME = "$AS3_CLASSNAME.xml"
$AS3_CERTNAME = "$AS3_CLASSNAME.cert"
$OUTPUT_FILEPATH = "bin\$OUTPUT_FILENAME"
$OUTPUT_FULLPATH = "$AIRSDK_HOME\$OUTPUT_FILEPATH"
$APPLICATION_NAME = "$AS3_CLASSNAME-windows"
$APPLICATION_FULL = "$AIRSDK_HOME\bin\$APPLICATION_NAME"
# The executable inside of the package is named by adt after the filename
# element of the descriptor: build\$AS3_CLASSNAME.xml
$APPLICATION_EXECUTABLE = "Launch-$AS3_CLASSNAME.exe"
