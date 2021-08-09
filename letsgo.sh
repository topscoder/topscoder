#!/bin/bash

# Run install scripts
sh macos-fresh-installation.sh
sh brew.sh
sh brew-cask.sh
#./oh-my-zsh.sh

# System settings
sh .macos
sh macos-user-defaults.sh
./macos-dock.py

sh .macos-paulirish

# Application settings
sh codium.sh
