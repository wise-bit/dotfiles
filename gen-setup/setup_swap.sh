#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "script requires root privileges, restarting with sudo..."
  exec sudo "$0" "$@"
  exit 0
fi

if [ -r /swapfile314 ]; then 
  echo "error: /swapfile314 already exists!"
  exit 1
fi

dd if=/dev/zero of=/swapfile314 bs=1024 count=1024000

chmod 0600 /swapfile314
mkswap /swapfile314
swapon /swapfile314

echo '/swapfile314 none swap sw 0 0' | sudo tee -a /etc/fstab

swapon --show

