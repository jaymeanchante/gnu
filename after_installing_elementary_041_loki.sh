#!/bin/bash
set -x
# Elementary OS 0.4 Loki
# Installing my programs

# update and upgrade system
sudo apt-get update && sudo apt-get upgrade -y

# allowing PPA:
sudo apt-get install software-properties-common gdebi -y

# adding the repository
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt-get update
# installing elementary-tweaks
sudo apt-get install elementary-tweaks -y

# R dependencies:
sudo apt-get install libssl-dev -y
sudo apt-get install libssh2-1-dev -y
sudo apt-get install libcurl4-openssl-dev -y

libxml2-dev

# installing firefox
sudo apt-get install firefox -y

# installing chromium
sudo apt-get install chromium-browser -y

# Transmission
sudo apt-get install transmission -y

# gnome-disk-utility or Disks
sudo apt-get install gnome-disk-utility -y

# abiword
sudo apt-get install abiword -y

# gnumeric
sudo apt-get install gnumeric -y

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Redshift
sudo apt-get install redshift redshift-gtk

# gdal (for R's rgdal package)
sudo apt-get install libgdal1-dev libproj-dev

# MEGAsync
cd /tmp
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb
sudo gdebi megasync-xUbuntu_16.04_amd64.deb
rm megasync-xUbuntu_16.04_amd64.deb
cd ~/

# R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update
sudo apt-get install r-base

# installing Miniconda:
cd /tmp
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh
cd ~/

