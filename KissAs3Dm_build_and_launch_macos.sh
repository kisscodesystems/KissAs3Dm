#!/bin/bash

# To build this project, you are going to need the following tools:
# - java jre or jdk installed or unzipped
# - airsdk installed or unzipped
# This will build your project as a bundle for macOS users.

# ! On macOS: you have to have a valid license from harman: adt.lic !

# Go to ./build/scripts/macos/setup.sh and specify the aboves!

# The class name of the demo application to build is the first argument of this
# script, the ApplicationDemo is built when there is no argument at all:
# ./KissAs3Dm_build_and_launch_macos.sh              -> ApplicationDemo
# ./KissAs3Dm_build_and_launch_macos.sh QuickUIDemo  -> QuickUIDemo
AS3_CLASSNAME="$1"

PWD=`pwd`
./build/scripts/macos/setup.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/macos/prepare.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/macos/build_app.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/macos/create_cert.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/macos/create_app.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/macos/launch_app.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
