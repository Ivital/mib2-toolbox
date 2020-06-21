#!/bin/sh

# MIB2 script, part of the MIB High toolbox.
# Coded by Jille
# This script will take a description, a source file or folder and a target
# call script by ./copy_file.sh <description> <topic> <mibpath> <sdpath> <folder_or_file>
# for instance /eso/bin/PhoneCustomer/default/copy_file.sh "This script will copy a new FEC container onto your device" "FEC" "/Custom/Advanced/FEC/FecContainer.fec" "/net/rcc/mnt/efs-persist/FEC/FecContainer.fec"

#todo: add option to copy an entire folder recursively

DESCRIPTION=$1  # What this script does. Shows info to the user during execution.
TOPIC=$2        # Topic, for instance Skinfiles.
MIBPATH=$3      # path on the MIB that has to be backupped/replaced
SDPATH=$4       # path on the SD that holds the new file(s)
TYPE=$5         # "folder" or "file". If it's a folder, the script will recursively backup and copy.


#Firmware/unit info:
VERSION="$(cat /net/rcc/dev/shmem/version.txt | grep "Current train" | sed 's/Current train = //g' | sed -e 's|["'\'']||g' | sed 's/\r//')"
FAZIT=$(cat /tmp/fazit-id);

echo "---------------------------"
echo "$DESCRIPTION"
echo FAZIT of this unit: "$FAZIT"
echo Firmware version: "$VERSION"
echo "---------------------------"
echo ""
echo "Warning: Do not exit this screen before it's done."
echo ""
sleep .1

#Is there any SD-card inserted?
if [ -d /net/mmx/fs/sda0 ]; then
    echo SDA0 found
    VOLUME=/net/mmx/fs/sda0
elif [ -d /net/mmx/fs/sdb0 ] ; then
    echo SDB0 found
    VOLUME=/net/mmx/fs/sdb0
else 
    echo No SD-cards found.
    echo Script stopped.
    exit 0
fi

sleep .1

echo Mounting SD-card.
mount -uw $VOLUME

sleep .1

#Make backup folder
#For instance: /sda0/Backup/1347/JTD-12345/Skinfiles/
BACKUPFOLDER=$VOLUME/Backup/$VERSION/$FAZIT/$TOPIC/

if [[ -d "$BACKUPFOLDER" ]]
then
    echo "$BACKUPFOLDER exists already, no backup needed."
else 
    echo "Making backup folders on SD-card."
    mkdir -p "$BACKUPFOLDER"

    echo "Copying target file(s) to backup folder on SD-card."
    echo "This can take some time. Please wait."
    if [[ "$TYPE" == "folder" ]]
    then
        cp -R "$MIBPATH" "$BACKUPFOLDER"
    else 
        cp "$MIBPATH" "$BACKUPFOLDER"
    fi 
    echo "Backup done. Saved at $BACKUPFOLDER"   
fi

sleep .1
# Make app volume writable
echo "Mounting app folder."
mount -uw /mnt/app
echo "Mounting system folder."
mount -uw /mnt/system
sleep .1

echo ""
echo "Copying modified files from SD folder to MIB."
echo "This can take some time. Please wait."

if [[ "$TYPE" == "folder" ]]
then
    cp -R "$SDPATH" "$MIBPATH"/..
else 
    cp "$SDPATH" "$MIBPATH"
fi 


# Make readonly again
mount -ur /mnt/app
mount -ur /mnt/system
mount -ur $VOLUME
sleep .1


echo "Please restart the unit to make sure the new files are applied."
echo "Backups are placed at $BACKUPFOLDER"
echo "In case something went wrong, re-install the backupped file."
echo "Script done, you can now leave this screen." 

exit 0
