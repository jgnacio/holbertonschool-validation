#!/usr/bin/bash
sudo apt-get update
sudo apt-get install -y python3 python3-pip git zip;

# Install markdown-link-cli and markdown-link-check
npm install -g markdownlint-cli markdown-link-check;

curl -LO https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && \
    chmod +x hadolint-Linux-x86_64 && \
    mv hadolint-Linux-x86_64 /usr/bin/hadolint;

# W3C validator dependencies
python3 -m pip install requests
