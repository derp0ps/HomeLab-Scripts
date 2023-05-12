#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 
    read -p "Do you want to elevate to root? [y/n]" answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        exec sudo "$0" "$@" 
    else
        exit 1
    fi
fi

apt-get update
apt-get upgrade -y
apt-get autoremove
