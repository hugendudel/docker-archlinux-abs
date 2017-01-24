FROM stinga0815/archlinux-base:latest
MAINTAINER Harm Endres <harm.mueller@gmail.com>
RUN pacman -Sy --needed --noconfirm sudo base-devel abs
RUN useradd -m -g users -G wheel -s /usr/bin/bash makepkg
RUN echo 'makepkg ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
