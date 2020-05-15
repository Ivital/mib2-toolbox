#!/bin/sh

DESCRIPTION="This script will copy a new FEC container onto your device"
TOPIC=FEC
SDPATH=/Custom/Advanced/FEC/FecContainer.fec 
MIBPATH=/net/rcc/mnt/efs-persist/FEC/FecContainer.fec

/eso/bin/PhoneCustomer/default/copy_file.sh "$DESCRIPTION" "$TOPIC" "$SDPATH" "$MIBPATH"

echo "Done"
exit 0