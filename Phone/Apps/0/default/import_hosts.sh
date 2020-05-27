#!/bin/sh

DESCRIPTION="This script will replace the hosts file with the hosts file in Advanced/Hosts/hosts.txt."
TOPIC=Hosts
SDPATH=/Custom/Advanced/Hosts/hosts.txt
MIBPATH=/net/mmx/mnt/system/etc/hosts

/eso/bin/PhoneCustomer/default/copy_file.sh "$DESCRIPTION" "$TOPIC" "$SDPATH" "$MIBPATH"

echo "Done"
exit 0