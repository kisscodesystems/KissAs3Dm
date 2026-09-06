#!/bin/bash

# The application to build is the first argument of this script.

source build/scripts/macos/setup.sh "$1"

echo " "
echo "Creating your final app package with adt.."

cd $AIRSDK_HOME/bin && rm -rf $APPLICATION_NAME
cd $AIRSDK_HOME/bin && ./adt \
  -licenseFile $LICENSE_FILE \
  -package \
  -storetype pkcs12 \
  -keystore certs/$AS3_CERTNAME \
  -storepass $KEYSTORE_PASS \
  -target bundle \
  $APPLICATION_NAME \
  $XML_FILENAME \
  $OUTPUT_FILENAME \
  icons

