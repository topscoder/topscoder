#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Install XCode Command Line Tools
source ./utils.sh

clear_logs

log_info "runme.sh starting..."

# Only clone if .dotfiles are not installed already
if ! [[ $(pwd) =~ (\.dotfiles$) ]];
then
    brew install git
    git clone https://github.com/topscoder/topscoder.git ./.dotfiles/
    cd .dotfiles/
fi

# Check if we are in .dotfiles folder now. It's important. We need 'em
if ! [[ $(pwd) =~ (\.dotfiles$) ]];
then
    echo
    echo " ==> IT LOOKS LIKE THE .DOTFILES FOLDER IS NOT INSTALLED."
    echo " ==> PLEASE FIX IT. "
    echo " ==> I QUIT. "
    echo
    exit 1
fi

# Install ZSH shell
sh .app-zsh

# Unlock quarantaine mode for apps
sh .macos-unlocker

# Install Homebrew
sh .app-homebrew


# Install and upgrade (by default) cli-tools, apps from the Brewfile (.brewfile).
brew bundle --file=.brewfile

# Install Irvue wallpaper manager from App Store
mas install 1039633667


# Git configuration
sh .conf-git

# macOS configuration
conf_mac=(
    '.macos' 
    '.macos-user-defaults' 
    '.macos-paulirish' 
    '.macos-dock')

for cfile in "${conf_mac[@]}"; 
do
    # if ask "$cmd" Y; then
    cmd="sh $cfile"
    /bin/bash -c "$cmd"
    # fi
done


# Application settings YEEHA!
apps=(
    '.app-vscodium' 
    '.app-chromium' 
    '.app-dropbox-maestral' 
    '.app-mackup')

for afile in "${apps[@]}"; 
do
    cmd="sh $afile"
    /bin/bash -c "$cmd"
done


# FIXME mackup restore? or after reboot?

# Done
finish_block " DON'T FORGET TO REBOOT NOW!"
finish_block " KTHXBAI"
