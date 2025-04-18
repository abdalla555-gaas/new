#!/bin/bash

echo "[*] Updating APT and installing base tools..."
apt update
apt install -y libstdc++6 wget nano || echo "[!] Failed installing base tools"

echo "[*] Enabling 32-bit architecture support..."
dpkg --add-architecture i386
apt update

echo "[*] Installing required 32-bit libraries..."

PKGS=(
  libc6:i386
  libncurses5:i386
  libncursesw5:i386
  libstdc++6:i386
  lib32ncursesw5
  libmysqlclient16
)

for pkg in "${PKGS[@]}"; do
  if apt install -y "$pkg"; then
    echo "[+] Installed $pkg"
  else
    echo "[!] Failed to install $pkg — skipping..."
  fi
done

# Fixing missing libncursesw.so.5
if [ ! -f /lib/x86_64-linux-gnu/libncursesw.so.5 ]; then
  echo "[*] libncursesw.so.5 not found. Downloading and installing..."
  wget http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/libncursesw5_5.9+20140118-1ubuntu1_amd64.deb
  dpkg -x libncursesw5_5.9+20140118-1ubuntu1_amd64.deb libtemp
  cp libtemp/lib/x86_64-linux-gnu/libncursesw.so.5 /lib/x86_64-linux-gnu/
  rm -rf libtemp
else
  echo "[*] libncursesw.so.5 already exists."
fi

# Fixing missing libtinfo.so.5
if [ ! -f /lib/x86_64-linux-gnu/libtinfo.so.5 ]; then
  echo "[*] libtinfo.so.5 not found. Downloading and installing..."
  wget http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/libtinfo5_5.9+20140118-1ubuntu1_amd64.deb
  dpkg -x libtinfo5_5.9+20140118-1ubuntu1_amd64.deb libtemp2
  cp libtemp2/lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/
  rm -rf libtemp2
else
  echo "[*] libtinfo.so.5 already exists."
fi

echo "[✔] Done. You can now try running your 32-bit binary again."
