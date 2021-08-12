#!/usr/bin/env bash

#################################################################################
# File  	    :   runme.sh
# Description	:   Bootstrapper for macOS dotfiles installation.
# Args         	:   
# Dependencies  :   utils.sh, brew, git
# Author       	:   topscoder
# Email         :   topscoder.at.gmail.dot.com
#################################################################################

source ./utils.sh

# Ask for the administrator password upfront
sudo --validate

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
sh ./dots/.app-zsh

# Install Homebrew
sh ./dots/.app-homebrew

# Install and upgrade (by default) cli-tools, apps from the Brewfile (.brewfile).
brew bundle --file=./dots/.brewfile

# Install Irvue wallpaper manager from App Store
mas install 1039633667

# Unlock quarantaine mode for apps
sh ./dots/.macos-unlocker

# Git configuration
sh ./dots/.conf-git

# macOS configuration
conf_mac=(
    '.macos' 
    '.macos-user-defaults' 
    '.macos-paulirish' 
    '.macos-dock')

for cfile in "${conf_mac[@]}"; 
do
    # if ask "$cmd" Y; then
    cmd="sh ./dots/$cfile"
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
    cmd="sh ./dots/$afile"
    /bin/bash -c "$cmd"
done

sh ./dots/.app-sync

# TODO mackup restore? or after reboot?

# Done
finish_block " ‼️ DON'T FORGET TO REBOOT NOW!"
finish_block " 😽 KTHXBAI"
