#!/bin/sh

# tips
# turn off onscreen keyboard: gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false
# turn off phone screen: wlr-randr --output DSI-1 --off

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
	wlr-randr

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

# redshift
sudo pacman -S pkg-config
yay -S redshift-wayland-git

## create start script
echo '#!/bin/bash
export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/1000
/usr/bin/redshift -l -30:-51 -m wayland' | sudo tee /usr/local/bin/start_redshift.sh
sudo chmod +x /usr/local/bin/start_redshift.sh

## create systemd service
echo '[Unit]
Description=start redshift with wayland

[Service]
Type=simple
ExecStart=/usr/local/bin/start_redshift.sh

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/redshift.service
sudo chmod 640 /etc/systemd/system/redshift.service
## setup service
sudo systemctl daemon-reload
sudo systemctl enable redshift
sudo systemctl start redshift
