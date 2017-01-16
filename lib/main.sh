#!/bin/bash
set -e

# This script is used to build OrangePi system
# Write: Buddy
# Date:  2017-01-05

# Support List
# Board Name         ||  Platform
# OrangePi PC2           Allwinner H5
# OrangePi Prima         Allwinner H5
# OrangePi Win           Allwinner A64
# OrangePi 3             Allwinner A64
# OrangePi Zeroplus2     Allwinner H5/H3
# OrangePi Zeroplus      RDA 8810
# OrangePi Zero          Allwinner H2+
# OrangePi Plus2         Allwinner H3
# OrangePi Plus2E        Allwinner H3
# OrangePi One           Allwinner H3
# OrangePi PC            Allwinner H3
# OrangePi 2             Allwinner H3
# OrangePi Lite          Allwinner H3
# OrangePi PC Plus       Allwinner H3
# OrangePi Mini2         Allwinner H3

whiptail --title "OrangePi Build System" --msgbox \
 "`figlet OrangePi` It's funny to build owner Linux system!        Let's go to Linux World with OrangePi" \
          15 50 0

MENUSTR="Plase select build option"

OPTION=$(whiptail --title "OrangePi Build System" \
    --menu "$MENUSTR" 10 50 2 --cancel-button Finish --ok-button Select \
    "0"   "Build system with kernel/uboot/rootfs" \
    "1"   "Download full distro Image" \
    3>&1 1>&2 2>&3)

DISTRO=$(whiptail --title "OrangePi Build System" \
    --menu "$MENUSTR" 20 60 12 --cancel-button Finish --ok-button Select \
    "0"   "orangepi PC2" \
    "1"   "orangepi Zero" \
    "2"   "orangepi PC Plus" \
    "3"   "orangepi Plus2e" \
    "4"   "orangepi Lite" \
    "5"   "orangepi Plus2" \
    "6"   "orangepi Plus" \
    "7"   "orangepi PC" \
    "8"   "orangepi One" \
    "9"   "orangepi 2" \
    "10"  "orangepi Mini2" \
    "11"  "orangepi Win" \
    3>&1 1>&2 2>&3)

if [ $OPTION = "0" ]; then
    # OrangePi H5
    if [ $DISTRO = "0" ]; then
        ./H5SDK_BuildEnvironment.sh
    # OrangePi A64
    elif [ $DISTRO = "11" ]; then
        ./A64SDK_BuildEnvironment.sh
    # OrangePi H2
    elif [ $DISTRO = "1" ]; then
        echo "H2"
    # OrangePi H3
    else
        ./H3SDK_BuildEnvironment.sh
    fi
elif [ $OPTION = "1" ]; then
    echo "Download Image"
else
    echo "Bad Operation"
fi
