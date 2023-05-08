#!/bin/bash
apt-get update && apt-get install -y wget make
mkdir /app/hugo_bin
wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz -P /app/hugo_bin/
tar -xf /app/hugo_bin/hugo_extended_0.84.0_Linux-64bit.tar.gz -C /app/hugo_bin/
mv /app/hugo_bin/hugo /bin/
rm -rf /app/hugo_bin
make build
