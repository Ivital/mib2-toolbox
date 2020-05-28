#!/bin/sh

SKINNAME=skin1

DESCRIPTION="This script will install $SKINNAME"
TOPIC=Skinfiles
SDPATH=/Custom/Skinfiles/$SKINNAME/images.mif
MIBPATH=/net/mmx/mnt/app/eso/hmi/lsd/Resources/$SKINNAME/images.mif

./copy_file.sh "$DESCRIPTION" "$TOPIC" "$MIBPATH" "$SDPATH" 

echo "Done"
exit 0