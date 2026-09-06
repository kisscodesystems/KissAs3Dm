#!/bin/bash

# The application to build is the first argument of this script.

source build/scripts/macos/setup.sh "$1"

echo " "
echo "Building your swf file first.."
$JAVA -jar $AIRSDK_HOME/lib/mxmlc-cli.jar \
  -load-config $AIRSDK_HOME/frameworks/air-config.xml \
  +flexlib $AIRSDK_HOME/frameworks \
  +configname=air \
  -debug=false \
  -use-network \
  -warnings \
  -default-background-color $SWF_BACKGROUND_COLOR \
  -default-frame-rate $SWF_FRAME_RATE \
  -default-script-limits $SWF_SCRIPT_LIMIT $SWF_SCRIPT_LIMIT \
  -default-size $SWF_WIDTH $SWF_HEIGHT \
  -compiler.source-path $KISSAS3FW_SRC $AS3_SRC \
  -o $OUTPUT_FULLPATH \
  -file-specs $AS3_FILEPATH

