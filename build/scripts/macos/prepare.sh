#!/bin/bash

# The application to build is the first argument of this script.

source build/scripts/macos/setup.sh "$1"

echo " "
date
echo "Building your $AS3_CLASSNAME airsdk project.."
echo " "
echo "JAVA: $JAVA"
echo "AIRSDK_HOME: $AIRSDK_HOME"
echo " "
echo "The location of your final app will be"
echo $APPLICATION_FULL
echo "You can zip it or create an installer from it if you want."
echo " "
echo "   ______________ "
echo "  +--------------+"
echo "  : Making swf   : $OUTPUT_FULLPATH"
echo "  +--------------+"
echo "  : From         : $AS3_FILEPATH"
echo "  : With bgcolor : $SWF_BACKGROUND_COLOR"
echo "  : With width   : $SWF_WIDTH"
echo "  : With height  : $SWF_HEIGHT"
echo "  +--------------+"

rm $OUTPUT_FULLPATH

cp -R build/icons $AIRSDK_HOME/bin/
cp build/$XML_FILENAME $AIRSDK_HOME/bin/
mkdir -p $AIRSDK_HOME/bin/certs

