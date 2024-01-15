#!/bin/bash
set -e
. setdevkitpath.sh

export JDK_DEBUG_LEVEL=release

sudo apt update
sudo apt -y install autoconf python unzip zip

if [[ -z "$NDK_USE_EXISTING" ]]; then
  wget -nc -nv -O android-ndk-$NDK_VERSION-linux-x86_64.zip "https://dl.google.com/android/repository/android-ndk-$NDK_VERSION-linux-x86_64.zip"
  ./extractndk.sh
fi

# Some modifies to NDK to fix

./getbootjdk.sh
./getlibs.sh
./buildlibs.sh
./clonejdk.sh
./buildjdk.sh
./removejdkdebuginfo.sh
./tarjdk.sh
