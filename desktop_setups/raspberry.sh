## 0. Intro
# download raspbian lite
# use etcher.io to burn a sd card
# power raspberrypi
# login: pi; password: raspberry

# 1. Set wifi
sudo raspi-config
# 2 Network Options

## 2. Expand SD card
sudo raspi-config
# 7 Advanced Options
# A1 Expand Filesystem
# sudo reboot

## 3. update, locale, keyboard
sudo apt-get update && sudo apt-get upgrade
# 4 Localisation Options
# I1 Change Locale
# I2 Change Timezone
# I3 Change Keyboard Layout
# sudo reboot

## 4. Desktop, autologin
sudo apt-get install --no-install-recommends xserver-xorg xinit
sudo apt-get install raspberrypi-ui-mods
# sudo reboot
sudo raspi-config
# 3 Boot Options
# B1 Desktop/CLI
# B4 Desktop Autologin
# sudo reboot
