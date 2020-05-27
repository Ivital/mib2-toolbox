#!/bin/sh

DESCRIPTION="This script will install GEM.jar"
TOPIC=GEM
SDPATH=/Custom/Advanced/GEM/GEM.jar
MIBPATH=/eso/hmi/lsd/jars/GEM.jar

/eso/bin/PhoneCustomer/default/copy_file.sh "$DESCRIPTION" "$TOPIC" "$SDPATH" "$MIBPATH"

echo "Done"
exit 0