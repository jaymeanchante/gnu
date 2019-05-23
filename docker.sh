sudo apt-get update
sudo apt-get install docker.io
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
