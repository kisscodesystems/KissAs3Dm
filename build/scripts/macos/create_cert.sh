#!/bin/bash

# The application to build is the first argument of this script.

source build/scripts/macos/setup.sh "$1"

echo " "
if [[ -f $AIRSDK_HOME/bin/certs/$AS3_CERTNAME ]]
then
  echo "Your certificate has been created before."
else
  echo "Creating your self signed certificate right now."
  cd $AIRSDK_HOME/bin && ./adt \
  -certificate \
	-cn selfsigned \
	-ou orgUnit \
	-o orgName \
	-c HU \
	-validityPeriod 1 \
	2048-RSA \
	certs/$AS3_CERTNAME \
	$KEYSTORE_PASS
fi

