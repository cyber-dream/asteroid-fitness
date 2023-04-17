#!/bin/sh

source /usr/local/oecore-x86_64/environment-setup-armv7vehf-neon-oe-linux-gnueabi
export CMAKE_PROGRAM_PATH=/usr/local/oecore-x86_64/sysroots/armv7vehf-neon-oe-linux-gnueabi/usr/bin/
cmake -B build
cmake --build build
cmake --build build -t package

file="$(ls ./build/*.ipk | sort -V | tail -n1)"
filename="$(basename $file)"

sshpass -p "<password>" scp $file ceres@192.168.2.15:/home/ceres/
sshpass -p "<password>" ssh root@192.168.2.15 << EOF
  cd /home/ceres/
  opkg install --force-overwrite --force-reinstall $filename
chmod +x /usr/bin/asteroid-helloworld
EOF
