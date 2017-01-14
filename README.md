OrangePi Build System
---------------------------------------

Welcome to OrangePi Build System, Good start Linux World with OrangePi!
Funny with your idear and build your owner Linux system.

OrangePi Build System support list:
* OrangePi PC2
* OrangePi 3
* OrangePi Zero
* OrangePi Zeroplus
* OrangePi Zeroplus2
* OrangePi PCplus
* OrangePi Plus2E
* OrangePi Lite
* OrangePi One

Easy to build owner Linux distro in OrangePi Build System, please follow
thoese steps:

1. Download specify OrangePi Board.
```
./Build_OrangePi.sh
```

   Choose correct OrangePi version that you want, and scripts will download
   specify kernl, uboot and build scripts.

2. Build your owner Linux

   If your board is "OrangePi PC2", please change your dirent into "OrangePiH5"

   If your board is "OrangePi 3", please change your dirent into "OrangePiA64"

   If your board is another board, please change your dirent into "OrangePiH3"

   When you change your dirent as "OrangePiXX", and run command:
```
./build.sh
```

   You can build your owner system with "build.sh", and you can compile kernel,
   uboot, and rootfs in "build.sh".

3. Writing Image into your board
