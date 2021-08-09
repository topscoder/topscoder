#!/bin/bash

# Remove workspace auto-switching
defaults write com.apple.dock workspaces-auto-swoosh -bool NO
killall Dock # Restart the Dock process

# Enable repeating keys by pressing and holding down keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Change the default folder for screenshots
# Open the terminal and create the folder where you would like to store your screenshots:
# mkdir -p /path/to/screenshots/
# defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer