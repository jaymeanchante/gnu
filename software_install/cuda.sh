# hardware & software
# ubuntu-16.04.5
# nvidia gtx 1080
# cuda 9.2 for tensorflow and rapidsai compatibility

# install nvidia drivers
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# cuda 9.2
wget https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux
sudo sh cuda_9.2.148_396.37_linux

# cudnn 7.4 for cuda 9.2
firefox https://developer.nvidia.com/rdp/cudnn-download
login to your nvidia account
agree to the license terms
download cudnn 7.4 for cuda 9.2 runtime
tar -xzvf cudnn-9.2-linux-x64-v7.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# local tensorflow installation
conda create -n tf-gpu python==3.5
conda install tensorflow-gpu

# local rapidsai installation
conda create -n rapidsai python==3.5
conda install -c numba -c conda-forge -c nvidia -c rapidsai -c defaults cudf=0.3.0

# docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world

# nvidia-docker
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi

# nvtop
sudo apt install cmake libncurses5-dev libncursesw5-dev git
cd /tmp
git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake ..
make
sudo make install

# tensorflow container
docker pull tensorflow/tensorflow:latest-gpu-py3-jupyter
docker run --runtime=nvidia -it -p 8888:8888 tensorflow/tensorflow:latest-gpu-py3-jupyter

# rapidsai container
docker pull rapidsai/rapidsai:ubuntu1604_cuda92_py35
docker run --runtime=nvidia --rm -it -p 8888:8888 -p 8787:8787 -p 8786:8786 rapidsai/rapidsai:ubuntu1604_cuda92_py35
