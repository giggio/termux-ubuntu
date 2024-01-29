#!/usr/bin/env bash

USER=giggio
apt-get update
apt-get install -y sudo
useradd $USER -u 1000 --create-home --shell "`which bash`" --groups sudo
echo -e "$USER\tALL=(ALL:ALL)\tALL" >> /etc/sudoers

echo "Enter the user's password:"
passwd $USER

