#!/bin/sh

DESCRIPTION="This script will copy custom ESD(Green Menu) files from GreenMenu folder on your SD to the unit."
TOPIC=GreenMenu
SDPATH=/Custom/GreenMenu/
MIBPATH=/eso/hmi/engdefs/

/eso/bin/PhoneCustomer/default/copy_file.sh "$DESCRIPTION" "$TOPIC" "$MIBPATH" "$SDPATH" file

SDPATH2=/Custom/GreenMenu/Scripts
MIBPATH2=/eso/hmi/engdefs/scripts/

/eso/bin/PhoneCustomer/default/copy_file.sh "$DESCRIPTION" "$TOPIC" "$MIBPATH2" "$SDPATH2" file
chmod a+rwx /eso/hmi/engdefs/scripts/*

echo Done. Please restart green menu.

exit 0
