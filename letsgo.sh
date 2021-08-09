#!/bin/bash

# Run install scripts
./macos-fresh-installation.sh
./brew.sh
./brew-cask.sh
#./oh-my-zsh.sh

# System settings
./macos.sh
./macos-user-defaults.sh
python3 ./macos-dock.py

# Application settings
./codium.sh