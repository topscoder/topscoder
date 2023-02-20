#!/usr/bin/env bash

#################################################################################
# File  	    :   installer.sh
# Description	:   Bootstrapper for macOS dotfiles installation.
# Args         	:   
# Dependencies  :   utils.sh, brew, git
# Author       	:   topscoder
# Email         :   topscoder.at.gmail.dot.com
#################################################################################

source ./utils.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Ask for the administrator password upfront
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sudo --validate

clear_logs

log_info "installer.sh starting..."

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Only clone if .dotfiles are not installed already
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ ! -d "~/.dotfiles" ]
then
    brew install git
    git clone https://github.com/topscoder/topscoder.git ~/.dotfiles/
else
    git update
fi

cd ~/.dotfiles/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Check if we are in .dotfiles folder now. It's important. We need 'em
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# if [ ! -d "~/.dotfiles" ]
# then
#     print_error " ==> IT LOOKS LIKE THE .DOTFILES FOLDER IS NOT INSTALLED."
#     print_error " ==> PLEASE FIX IT. "
#     print_error " ==> I QUIT. 👋 "
#     exit 1
# fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install ZSH shell
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sh ~/.dotfiles/dots/.app-zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install Homebrew
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sh ~/.dotfiles/dots/.app-homebrew

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install and upgrade (by default) cli-tools, apps from the Brewfile (.brewfile).
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
brew bundle --file=~/.dotfiles/dots/.brewfile

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install Irvue wallpaper manager from App Store
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mas install 1039633667

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Unlock quarantaine mode for apps
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sh ~/.dotfiles/dots/.macos-unlocker

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Git configuration
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sh ~/.dotfiles/dots/.conf-git

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# macOS configuration
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
conf_mac=(
    '.macos' 
    '.macos-user-defaults' 
    '.macos-paulirish' 
    '.macos-dock')

for cfile in "${conf_mac[@]}"; 
do
    cmd="sh ~/.dotfiles/dots/$cfile"
    /bin/bash -c "$cmd"
done


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Application settings YEEHA!
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
apps=(
    '.app-vscodium' 
    '.app-dropbox-maestral' 
    '.app-mackup'
    '.app-sync')

for afile in "${apps[@]}"; 
do
    cmd="sh ~/.dotfiles/dots/$afile"
    /bin/bash -c "$cmd"
done


# Done
print_info 'Restart'

ask_for_confirmation 'Do you want to reboot now?'
if answer_is_yes; then
    restart
fi

finish_block " 😽 KTHXBAI"
