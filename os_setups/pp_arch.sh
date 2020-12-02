#!/bin/sh

# system wide update
sudo pacman -Syu

# yay
sudo pacman -S fakeroot
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si


# utils
sudo pacman -S \
	git \
	wget \
	htop \
	neofetch \
	unzip \
	make \
	cmake \
	gcc \
	sdl2 \
	sdl2_mixer \
	libpng \
	wlr-randr \ # wlr-randr --output DSI-1 --off

# android apps
sudo pacman -S anbox anbox-image-aarch64 adb

# nice apps
sudo pacman -S \
	foliate \
	libreoffice \
	newsboat

# comms
sudo pacman -S telegram-desktop

# music
sudo pacman -S mpv mps-youtube

# setup
sudo systemctl start sshd.service
sudo systemctl enable sshd.service
