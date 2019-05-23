#!/bin/bash

echo "\ncloning github repos\n
please, input your git credentials below\n"

read -p "username: " username
read -p "password: " password

git clone "https://$username:$password@github.com/jayme-anchante/repos"

while read p
do
    dir=$(echo $p | cut -d "/" -f 2)
    repo=$(echo $p | cut -d "/" -f 3)
    mkdir -p $dir
    cd $dir
    git clone "http://"$username":"$password$p
    cd $repo
    git fetch --all
    cd ../../
done < repos/private.txt

while read p
do
	git clone "https://github.com/jayme-anchante/$p"
    dir=$(echo $p | cut -d "/" -f 2)
    repo=$(echo $p | cut -d "/" -f 3)
    mkdir -p $dir
    cd $dir
    git clone "http://"$p
    cd $repo
    git fetch --all
    cd ../../
done < repos/public.txt

echo "creating a git-credentials file in ~/.git-credentials
please input information down below as follows
protocol=https
host=github.com
username=yourusername
password=yourpassword
"

git config --global credential.helper 'store --file ~/.git-credentials'
git credential-store --file ~/.git-credentials store
