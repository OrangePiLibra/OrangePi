#!/bin/bash
set -e

# This script is used to build OrangePi H3 environment.
# Write by: Buddy
# Date:     2017-01-06

if [ -z $TOP_ROOT ]; then
    TOP_ROOT=`cd .. && pwd`
fi

if [ ! -d $TOP_ROOT/OrangePiH3 ]; then
    mkdir $TOP_ROOT/OrangePiH3
fi

# Github
kernel_GITHUB="https://github.com/OrangePiLibra/OrangePiH3_kernel.git"
uboot_GITHUB="https://github.com/OrangePiLibra/OrangePiH3_uboot.git"
scripts_GITHUB="https://github.com/OrangePiLibra/OrangePiH3_scripts.git"
toolchain_GITHUB="https://github.com/OrangePiLibra/OrangePiH3_toolchain.git"
external_GITHUB="https://github.com/OrangePiLibra/OrangePiH3_external.git"

# Prepare dirent
Prepare_dirent=(
kernel
uboot
scripts
toolchain
external
)

# Download Source Code from Github
function download_Code()
{
    for dirent in ${Prepare_dirent[@]}; do
        if [ ! -d $TOP_ROOT/OrangePiH3/$dirent ]; then
            cd $TOP_ROOT/OrangePiH3
            GIT="${dirent}_GITHUB"
            git clone --depth=1 ${!GIT}
            mv $TOP_ROOT/OrangePiH3/OrangePiH3_${dirent} $TOP_ROOT/OrangePiH3/${dirent}
        else
            cd $TOP_ROOT/OrangePiH3/${dirent}
            git pull
        fi
    done
}

function dirent_check() 
{
    for ((i = 0; i < 100; i++)); do

        if [ $i = "99" ]; then
            whiptail --title "Note Box" --msgbox "Please ckeck your network" 10 40 0
            exit 0
        fi
        
        m="none"
        for dirent in ${Prepare_dirent[@]}; do
            if [ ! -d $TOP_ROOT/OrangePiH3/$dirent ]; then
                cd $TOP_ROOT/OrangePiH3
                GIT="${dirent}_GITHUB"
                git clone --depth=1 ${!GIT}
                mv $TOP_ROOT/OrangePiH3/OrangePiH3_${dirent} $TOP_ROOT/OrangePiH3/${dirent}
                m="retry"
            fi
        done
        if [ $m = "none" ]; then
            i=200
        fi
    done
}

download_Code
dirent_check
cd $TOP_ROOT
