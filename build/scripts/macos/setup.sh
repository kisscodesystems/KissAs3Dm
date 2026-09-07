#!/bin/bash

# The location of these tools and files on your computer. Leave every one of
# them empty: they are asked for once and stored in the project root, in .JAVA,
# .AIRSDK_HOME, .KISSAS3FW_SRC and .LICENSE_FILE. See ./read_setting.sh about
# them. Filling one of them in here makes that value the one being used.
JAVA=""
AIRSDK_HOME=""
KISSAS3FW_SRC=""
LICENSE_FILE=""
# For example
# JAVA=/usr/bin/java
# AIRSDK_HOME=/Users/myUser/AIRSDK_51.2.1
# KISSAS3FW_SRC=/Users/myUser/sources/KissAs3Fw/src
# LICENSE_FILE=/opt/adt.lic

source ./read_setting.sh
if [[ $JAVA == "" ]]
then
  JAVA=$(read_setting JAVA "the java executable, for example /usr/bin/java") || exit 1
fi
if [[ $AIRSDK_HOME == "" ]]
then
  AIRSDK_HOME=$(read_setting AIRSDK_HOME "the folder of the air sdk, for example /Users/myUser/AIRSDK_51.2.1") || exit 2
fi
if [[ $KISSAS3FW_SRC == "" ]]
then
  KISSAS3FW_SRC=$(read_setting KISSAS3FW_SRC "the src folder of the KissAs3Fw checkout, for example /Users/myUser/sources/KissAs3Fw/src") || exit 3
fi
if [[ $LICENSE_FILE == "" ]]
then
  LICENSE_FILE=$(read_setting LICENSE_FILE "the license file of harman, for example /opt/adt.lic") || exit 4
fi

# Specify your project specific values:
# The application to build is the first argument of this script. It is passed
# down by KissAs3Dm_build_and_launch_macos.sh, and the ApplicationDemo gets
# built when there is no argument at all.
AS3_CLASSNAME="$1"
if [[ $AS3_CLASSNAME == "" ]]
then
  AS3_CLASSNAME=ApplicationDemo
fi
SWF_BACKGROUND_COLOR=0xEEEEDD
SWF_FRAME_RATE=15
SWF_HEIGHT=1000
SWF_SCRIPT_LIMIT=1000
KEYSTORE_PASS=asdfasdf
# The size of the swf has to be the same as the window size in the descriptor
# of the app: build/$AS3_CLASSNAME.xml
case $AS3_CLASSNAME in
  ApplicationDemo)
    SWF_WIDTH=1600
    ;;
  QuickUIDemo)
    SWF_WIDTH=1682
    ;;
  *)
    echo "There is no application called $AS3_CLASSNAME!"
    echo "The available ones are: ApplicationDemo QuickUIDemo"
    exit 5;
    ;;
esac

# Other values you don't need to change
# The demo applications are in this project, the framework they are built on is
# a project of its own, checked out next to this one: KISSAS3FW_SRC points at
# the src folder of that checkout and both folders are on the source path of
# the compiler. These scripts are run from the root of this project.
AS3_SRC=$(pwd)/src
AS3_FILEPATH=$AS3_SRC/com/kisscodesystems/KissAs3Dm/$AS3_CLASSNAME.as
OUTPUT_FILENAME="$AS3_CLASSNAME.swf"
XML_FILENAME="$AS3_CLASSNAME.xml"
AS3_CERTNAME="$AS3_CLASSNAME.cert"
OUTPUT_FILEPATH="bin/$OUTPUT_FILENAME"
OUTPUT_FULLPATH="$AIRSDK_HOME/$OUTPUT_FILEPATH"
APPLICATION_NAME="$AS3_CLASSNAME.app"
APPLICATION_FULL="$AIRSDK_HOME/bin/$APPLICATION_NAME"
# The executable inside of the package is named by adt after the filename
# element of the descriptor: build/$AS3_CLASSNAME.xml
APPLICATION_EXECUTABLE="Launch-$AS3_CLASSNAME"
