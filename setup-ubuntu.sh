#!/usr/bin/env bash

USER=giggio

apt-get update
apt-get install -y proot-distro
proot-distro install ubuntu
proot-distro login ubuntu

proot-distro login $USER -- curl -fsSL --output ./setup-user.sh https://raw.githubusercontent.com/giggio/termux-ubuntu/main/setup-user.sh

proot-distro login ubuntu --user $USER
