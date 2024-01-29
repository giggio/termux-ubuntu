#!/usr/bin/env bash

set -euo pipefail

if ! [ -v 1 ] || [ -z "$1" ]; then
  echo "User not set, exiting."
  exit 1
fi
DISTRO_USER="$1"

apt-get update
apt-get install -y sudo
useradd "$DISTRO_USER" -u 1000 --create-home --shell "`which bash`" --groups sudo
echo -e "$DISTRO_USER\tALL=(ALL:ALL)\tALL" >> /etc/sudoers # Add user to sudoers, as adding to group sudo is not being enough

echo "User ($DISTRO_USER) created, you can now run 'proot-distro login ubuntu --user $DISTRO_USER' to login. To set password, run as root: 'passwd $DISTRO_USER'."
