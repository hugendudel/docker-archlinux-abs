#!/usr/bin/env bash
echo "Server = http://archpkg.hendr.es/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman -Sy
pacman -Qu
