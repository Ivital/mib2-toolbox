# MIB High toolbox
The ultimate MIB-HIGH toolbox for all your MIB1 High and MIB2 High customization needs.

Note: this screen has to potential to ruin your infotainment unit. The developers are not responsible for any troubles to anyone or anything caused by this toolbox.
It's never our intention to harm any person, car or brand. Use the tools wisely, don't be a douche.

Note2: This is **not** a universal Jailbreak-like solution for all your needs and firmware versions.

Note3: If you're a business who tries to make a profit off of this:  Don't be an asshole: Don't charge money for this. This project is done in my own time, out of love for the community. I've risked bricking my own hardware while testing, and invested a lot of time in the research. Instead of making money, why not support this project with your knowledge or a [small donation](https://paypal.me/chillout1). 

# Requirements
- Read the entire readme
- At least 1 healthy set of brains
- An MIB1 HIGH, MIB2 HIGH or MIB2.5 HIGH infotainment unit. It will **not** work on MIB1/MIB2 Standard units. Discover Media / Compostion Media is not MIB2 HIGH!
- 1 empty, **FAT32 formatted** SD-card, with enough space. Everything bigger than 1GB is fine
- Some place to save your backups
- Developer mode enabled on module 5F (you need VCDS/OBD11/VCP for this!)

## Optional requirements ##
- Python 2.7, if you want to extract/compress graphics containers (canim/mcf)
- Notepad, if you want to make your own green menu files or scripts
- Picture editing software, if you want to customize graphics files

# How to install
- Put all files and folders on an empty SD-card, preferable >1GB.
- Put the SD-card in one of the slots of your MIB-unit. 
- Make sure there's only 1 SD-card in your unit, otherwise the scripts don't know where to look.
- Hold the MENU button on your MIB and start the software update menu.
- Select the SD-card and select MIBx navigation database (where x is your type: MIB1 or MIB2).
- No worries, it will not install a navigation update, but this is because of the shared metainfo for MIB1 and MIB2.
- Select your update and install it.
- Let the unit run the entire software update. It will reboot several times
- When it's done, it will ask you to connect a computer and clear the error codes. This is not needed.
- The unit will restart one final time and you're back at the main car menu. Installation is now done.
- Hold the MENU button, and go to TESTMODE. On older versions you can go to the developer menu by holding the MENU button for about 10 seconds.
- Go to the Green Developer Menu
- There will be an additional menu called "mqbcoding". When you see this, the installation was succesful.
- Go to mqbcoding, and you will see the following:

![The MQB Coding toolbox menu](https://i.imgur.com/mLHXCmT.png)

- Run the "Get new scripts and files from SD-card (slot1)" script, and additional files will be installed.
- You're now done.
- Enjoy!

# How to do a manual installation
- Put the mib-toolbox on an SD-card and insert it into the MIB-unit
- Make a connection to the debug console of the unit (either via D-Link Dub-E100 on the USB port, or serial interface on the back of the unit)
- Log in
- make the mmx app volume writable: mount -uw /net/mmx/mnt/app/
- in case of MIB1: 
```
cp /net/mmx/fs/sda0/Mib1/toolbox/mqbcoding.esd /net/mmx/mnt/app/eso/hmi/engdefs/mqbcoding.esd
cp /net/mmx/fs/sda0/Mib1/toolbox/Scripts/*.* /net/mmx/mnt/app/eso/hmi/engdefs/scripts/

```

- in case of MIB2: 
```cp /net/mmx/fs/sda0/Mib2/PersonalPOI/PayLoad/0/default/payload.sh /net/mmx/mnt/app/eso/hmi/engdefs/mqbcoding.esd```

- Your unit needs to be set in developer-mode. This can be done through adaptation of module 5F in VCDS/VCP/OBD11. Or you could run the following commands on console to try to enable dev-mode.
```
export LD_LIBRARY_PATH=/net/mmx/mnt/app/root/lib-target:/net/mmx/mnt/eso/lib:/net/mmx/eso/lib:/net/mmx/mnt/app/usr/lib:/net/mmx/mnt/app/armle/lib:/net/mmx/mnt/app/armle/lib/dll:/net/mmx/mnt/app/armle/usr/lib
export IPL_CONFIG_DIR=/etc/eso/production
on -f mmx  /net/mmx/eso/bin/dumb_persistence_writer -P 0 3221356557 01
```
Note: results may very, some firmwares/brands/units have different paths, but the persistence address and value will be the same. Reboot after setting the value succesfully.

- Hold the MENU button, and go to TESTMODE. On older versions you can go to the developer menu by holding the MENU button for about 10 seconds.
- Go to the Green Developer Menu
- There will be an additional menu called "mqbcoding". When you see this, the installation was succesful.

- In case of MIB2: Run the "Get new scripts and files from SD-card (slot1)" script, and additional files will be installed.
- You're now done.
- Enjoy!

# Green menu screen overview:

On MIB1, the menu-structure is like this:
```
MQBCoding
|
+---Dump                                # dump various data to SD-card
|   
+---Customization                       # customisation features        
|   +---Skin                            # Skin graphics import
|   +---Startup                         # Startup graphics import
|   +---GreenMenu                       # Import new green menu screens and scripts
|   +---Advanced                        # Import shadow file, FECs and such
|   +---Updates                         # Custom SWDL modes and emergency
|
+---Disclaimer                          # Some wise words
|    
\---History                             # Version history of the toolbox
```


On MIB2, the menu-structure is like this:
```
MQBCoding
|
+---Dump                                # dump various data to SD-card
|   
+---Customization                       # customisation features        
|   +---Skin                            # Skin graphics import
|   +---AndroidAuto                     # Android Auto custom apps patch
|   +---Startup                         # Startup graphics import
|   +---Sounds                          # Sounds import (experimental)
|   +---Various                         # Various tweaks
|   +---GreenMenu                       # Import new green menu screens and scripts
|   +---Navigation                      # Navigation tweaks
|   +---Advanced                        # Import shadow file, FECs and such
|   +---Updates                         # Custom SWDL modes and emergency
|   +---Coding                          # Long coding editor
|   \---Adaptations                     # Adaptation channels
|       +---CarFunctionsList_BAP
|       +---CarFunctionsList_CAN
|       +---CarDeviceBusAssignment
|       +---RCC
|       +---VariantInfo
|       +---HMI_FunctionBlockingTable
|       +---WLAN
|      
+---privacy                             # Privacy features
|
+---MIB_Information                     # Information about the unit
|   \---password                        # Password finder
|
+---Disclaimer                          # Some wise words
|
+---Funstuff                            # Doesn't need explaining
|   \---FamousQoutes                    
|    
\---History                             # Version history of the toolbox
```

# How to use the new screens

Most screens have a description inside, or show information when running a script. It's always wise to have an SD-card in slot 1.


# How to use the tools
In the Tools folder you will find a couple of tools:
- extract-canim_seat.py
- extract-canim_vw.py

These are Python-scripts to extract startup screen files (.canim files) in 2 formats. If one of the scripts doesn't extract your canim, try the other one. Both work in the same way: extract_canim.py <filename> <outdir>, for instance: 

```extract_canim.py test.canim .\testfiles\```

- extract-mcf.py
 
This a python script to extract skinfile containers (mcf) and it works similar to the canim-extract: extract_mcf.py <filename> <outdir>, for instance:
 
 ```extract_mcf.py images.mcf .\extracted\```
 
 
- compress-canim_seat.py
- compress-canim_vw.py

These are the scripts to compress the startup-screens. Make sure you use the same compress-method you used when extracting. Usage: compress-canim.py <original-file> <new-file> <imagesdir>, for instance:

```compress-canim.py test.canim modified.canim .\testfiles\```

- compress-mcf.py
This is the script to compress the MCF-container. Usage: compress-mif.py <original-file> <new-file> <imagesdir>, for instance:
  
```compress-mcf.py images.mcf images2.mcf .\extracted\```

- extract-cff.py
This script can extract images.cff files, container files for navigation icons and materials. Usage: extract-cff.py <output dir>, for instance:
  
```extract-cff.py images.cff c:\extracted\```


## F.A.Q.
If you run into any issues, consult the [F.A.Q.](https://github.com/jilleb/mib2-toolbox/blob/master/FAQ.md).

## Supported firmware versions
This toolbox probably doesn't work on all available firmware versions. IOC version can be an issue too and can cause fatal metadata/release info errors upon installing. I'm currently investigating this issue (issue #1)


# Disclaimer:
**Warning** These screens have the potential to break your unit and void your warranty. Be careful. We are not responsible for any troubles to you, your car or software. MQB Coding is always looking for cool hacks and retrofits to increase the potential of the MQB platform. It's never our intention to harm any person, car or brand.

## Support this project

You're always welcome to support this project with your knowledge, ideas or a [small donation](https://paypal.me/chillout1) to my Paypal. 

