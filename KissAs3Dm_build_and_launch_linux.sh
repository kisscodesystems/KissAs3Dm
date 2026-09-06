#!/bin/bash

# To build this project, you are going to need the following tools:
# - java jre or jdk installed or unzipped
# - airsdk installed or unzipped
# This will build your project as a bundle for Linux users.

# ! On Linux: you have to have a valid license from harman: adt.lic !

# Go to ./build/scripts/linux/setup.sh and specify the aboves!

# The class name of the demo application to build is the first argument of this
# script, the ApplicationDemo is built when there is no argument at all:
# ./KissAs3Dm_build_and_launch_linux.sh              -> ApplicationDemo
# ./KissAs3Dm_build_and_launch_linux.sh QuickUIDemo  -> QuickUIDemo
AS3_CLASSNAME="$1"

PWD=`pwd`
./build/scripts/linux/setup.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/linux/prepare.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/linux/build_app.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/linux/create_cert.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/linux/create_app.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
./build/scripts/linux/launch_app.sh "$AS3_CLASSNAME" || exit $?
cd $PWD
