# set the keyboard layout as ABNT
setxkbmap -model thinkpad -layout br
localectl set-x11-keymap br thinkpad

# bluetooth
sudo apt-get install blueman pulseaudio-module-bluetooth
pactl load-module module-bluetooth-discover
# restart, the bluetooth icon should appear in right lower corner
# make discoverable, pair headphone, change audio output
# trisquel > System > Preferences > Hardware > Sound

# remove gnome-orca screen-reader
sudo apt-get purge --auto-remove gnome-orca

# install git, htop, pip3 etc.
sudo apt-get install -y htop
sudo apt-get install -y git
sudo apt-get install -y redshift redhisft-gtk
# must manually set localtions `redshift -l -25:-50` for Curitiba Lat:Lon

# setting Python3
sudo apt-get install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install numpy pandas jupyter

# setting Python2
sudo apt-get install python-pip -y
sudo pip2 install --upgrade pip
python2 -m pip install ipykernel
python2 -m ipykernel install --user

# installing R
sudo apt-get install libssl-dev libcurl4-openssl-dev -y
sudo apt-get install r-base r-base-dev -y
#install IRkernel
sudo apt-get install libxml2-dev -y
#install.packages('tidyverse', repos = 'https://cran-r.c3sl.ufpr.br/')

# pspp
sudo add-apt-repository ppa:adamzammit/pspp -y
sudo apt-get update
sudo apt-get install pspp -y
