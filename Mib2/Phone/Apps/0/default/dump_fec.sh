#!/bin/sh

#info
TOPIC=FEC
DESCRIPTION="This script will dump the FEC folder"

#Volumes/files
VOLUME=/fs/sda0
ORIGINAL=/net/rcc/mnt/efs-persist/FEC

#Firmware/unit info:
VERSION="$(cat /net/rcc/dev/shmem/version.txt | grep "Current train" | sed 's/Current train = //g' | sed -e 's|["'\'']||g' | sed 's/\r//')"
FAZIT=$(cat /tmp/fazit-id);

echo $DESCRIPTION
echo FAZIT of this unit: $FAZIT
echo Firmware version: $VERSION
echo "---------------------------"
sleep .5

#Make app volume writable
echo Mounting app folder.
mount -uw /mnt/app
mount -uw /mnt/system

#Is there any SD-card inserted?
if [ -d /net/mmx/fs/sda0 ]; then
    echo SDA0 found
    VOLUME=/net/mmx/fs/sda0
elif [ -d /net/mmx/fs/sdb0 ] ; then
    echo SDB0 found
    VOLUME=/net/mmx/fs/sdb0
else 
    echo No SD-cards found.
    exit 0
fi

sleep .5

echo Mounting SD-card.
mount -uw $VOLUME

sleep .5

#Make backup folder
DUMPFOLDER=$VOLUME/Dump/$VERSION/$FAZIT/

echo Dump-folder: $DUMPFOLDER

echo Dumping, please wait. This can take a while.

mkdir -p $VOLUME/Dump/$VERSION/$FAZIT/$TOPIC


echo Copying files
cp -R $ORIGINAL $DUMPFOLDER
ls -R $DUMPFOLDER/FEC > $DUMPFOLDER/FEC/files.txt

sleep 1

echo Listing all files:
sleep .5

cat $DUMPFOLDER/FEC/files.txt

rm $DUMPFOLDER/FEC/files.txt

# Make readonly again
mount -ur /net/mmx/fs/sda0

echo "Done. FEC dump can be found in the Dump folder on your SD-card"

exit 0
