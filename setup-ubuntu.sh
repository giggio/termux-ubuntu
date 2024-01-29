#!/usr/bin/env bash

set -euo pipefail

if ! [ -v 1 ] || [ -z "$1" ]; then
  echo "User not set, exiting."
  exit 1
fi
DISTRO_USER="$1"

if proot-distro list 2>&1 | sed -e 's/\x1b\[[0-9;]*m//g' | grep -A1 ubuntu | grep Installed | grep yes &> /dev/null; then
  echo "Ubuntu is already installed, exiting."
  exit 0
fi

proot-distro install ubuntu
proot-distro login ubuntu -- curl -fsSL --output ./setup-user.sh https://raw.githubusercontent.com/giggio/termux-ubuntu/main/setup-user.sh
proot-distro login ubuntu -- bash ./setup-user.sh "$DISTRO_USER"
proot-distro login ubuntu -- rm ./setup-user.sh
echo "Checking in Ubuntu: who am I?"
proot-distro login ubuntu --user "$DISTRO_USER" -- whoami

echo "Ubuntu is installed, you can now run 'proot-distro login ubuntu --user $DISTRO_USER' to login."
