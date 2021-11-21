#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need a version number'
    exit 0
fi

v=$1
version="https://releases.hashicorp.com/terraform/"$v"/terraform_"$v"_linux_amd64.zip"
echo "This script will install version $v of Terraform."

# Download and Install
cd ~/Downloads
wget $version -q --show-progress
unzip terraform_1*.zip
sudo mv terraform /usr/bin

# clean up
rm -f terraform
rm -f terraform_1*.zip
