#!/bin/sh

# system wide update
sudo pacman -Syu

# utils
sudo pacman -S git wget htop neofetch

# android apps
sudo pacman -S anbox anbox-image-aarch64 adb

# nice apps
sudo pacman -S foliate
