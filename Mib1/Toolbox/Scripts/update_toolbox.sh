#!/bin/sh

DESCRIPTION="This script will install an updated version of the MIB1 Toolbox"
TOPIC=Toolbox
SDPATH=/Mib1/Toolbox/mqbcoding.esd
MIBPATH=/net/mmx/net/mmx/mnt/app/eso/hmi/engdefs/mqbcoding.esd


./copy_file.sh "$DESCRIPTION" "$TOPIC" "$MIBPATH" "$SDPATH"


# Make it writable
mount -uw /mnt/app

echo "Copying scripts from sda0"
cp /fs/sda0/Mib1/Toolbox/Scripts/*.sh /net/mmx/net/mmx/mnt/app/eso/hmi/engdefs/scripts/
chmod a+rwx /net/mmx/net/mmx/mnt/app/eso/hmi/engdefs/scripts/*

# Make readonly again
mount -ur /mnt/app


echo "Done"
exit 0
