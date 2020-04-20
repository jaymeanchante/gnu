# initial system management
sudo apt autoremove
sudo apt-get update

# utils
sudo apt-get install -y adb cmake htop git libncurses5-dev libncursesw5-dev neofetch python3-dev python3-venv

# thunderbird
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa -y
sudo apt-get install thunderbird

# nvidia drivers
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo ubuntu-drivers autoinstall

# nvtop
cd /tmp
git clone https://github.com/Syllo/nvtop
mkdir -p nvtop/build && cd nvtop/build
cmake ..
make
sudo make install
cd

# docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt-get install docker-ce
# add docker user to sudoers
sudo usermod -aG docker ${USER}
su - ${USER}

# nvidia docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
# nvidia-container-runtime
sudo apt-get install nvidia-container-runtime
sudo tee /etc/docker/daemon.json <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
sudo pkill -SIGHUP dockerd

# docker-compose
# check https://github.com/docker/compose/releases for the latest release!
# 1.25.4 as of 2020-04-05
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.25.4/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# obs
sudo apt-get install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt-get update

# spotify
# ad muter: https://github.com/SecUpwN/Spotify-AdKiller
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# vscodium
# open source vscode without telemetry
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
sudo apt update && sudo apt install codium 
codium --install-extension ms-python.python
codium --install-extension ms-vscode-remote.vscode-remote-extensionpack


# redshift
sudo apt-get install redshift redshift-gtk
echo '
[redshift]
allowed=true
system=false
users=' | sudo tee -a /etc/geoclue/geoclue.conf

# gimp
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo apt-get install -y gimp

# v4l2loopback - a kernel module for creating virtual video devices
sudo apt-get install -y v4l2loopback-dkms v4l2loopback-utils

# latest node LTS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
# optional: install yarn
# curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo apt-get update && sudo apt-get install yarn
