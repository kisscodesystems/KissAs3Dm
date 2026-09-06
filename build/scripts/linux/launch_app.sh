#!/bin/bash

# The application to build is the first argument of this script.

source build/scripts/linux/setup.sh "$1"

echo " "
echo "We will launch it for you by:"
echo "cd $APPLICATION_FULL && ./$APPLICATION_EXECUTABLE"
cd $APPLICATION_FULL && ./$APPLICATION_EXECUTABLE
