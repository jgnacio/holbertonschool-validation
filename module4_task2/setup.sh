#!/usr/bin/bash
sudo apt-get update
sudo apt-get install -y python3 python3-pip git zip;

# Install markdown-link-cli and markdown-link-check
npm install -g markdownlint-cli markdown-link-check;

# W3C validator dependencies
python3 -m pip install requests
