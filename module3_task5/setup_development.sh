#!/usr/bin/bash
sudo apt-get update;
sudo apt-get install -y wget;

# Install hugo
sudo mkdir /app/hugo_bin;
sudo wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz -P /app/hugo_bin/;
sudo tar -xf /app/hugo_bin/hugo_extended_0.84.0_Linux-64bit.tar.gz -C /app/hugo_bin/;
sudo mv /app/hugo_bin/hugo /bin/;
sudo rm -rf /app/hugo_bin;
