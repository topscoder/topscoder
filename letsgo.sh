#!/bin/bash

# Run install scripts
./macos-fresh-installation.sh
./brew.sh
./brew-cask.sh
#./oh-my-zsh.sh

# System settings
./macos.sh
./macos-user-defaults.sh
./macos-dock.py

sh .macos
sh .macos-paulirish

# Application settings
./codium.sh
