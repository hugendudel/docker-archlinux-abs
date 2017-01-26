FROM stinga0815/archlinux-base:latest
MAINTAINER Harm Endres <harm.mueller@gmail.com>
RUN cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.tmp
RUN echo "Server = http://archpkg.hendr.es/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
RUN pacman -Sy --needed --noconfirm sudo base-devel abs
RUN useradd -m -g users -G wheel -s /usr/bin/bash makepkg
RUN echo 'makepkg ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN pacman -Scc --noconfirm
RUN mv /etc/pacman.d/mirrorlist.tmp /etc/pacman.d/mirrorlist
