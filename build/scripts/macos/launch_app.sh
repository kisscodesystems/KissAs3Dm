#!/bin/bash

# The application to build is the first argument of this script.

source build/scripts/macos/setup.sh "$1"

echo " "
# adt packages a real macos bundle, so it is started with open. The executable
# inside of it is the fallback, in case the bundle is not accepted by launchd.
echo "We will launch it for you by:"
echo "open $APPLICATION_FULL"
if ! open "$APPLICATION_FULL"
then
  echo "open did not work, starting the executable inside the bundle."
  "$APPLICATION_FULL/Contents/MacOS/$APPLICATION_EXECUTABLE"
fi
