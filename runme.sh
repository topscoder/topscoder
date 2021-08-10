#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Install XCode Command Line Tools
source ./utils.sh

# Only clone if .dotfiles are not installed already
if ! [[ $(pwd) =~ (\.dotfiles$) ]];
then
    brew install git
    git clone https://github.com/topscoder/topscoder.git ./.dotfiles/
    cd .dotfiles/
fi

# Check if we are in .dotfiles folder now. It's imprtant
if ! [[ $(pwd) =~ (\.dotfiles$) ]];
then
    echo
    echo 
    echo " ==> IT LOOKS LIKE THE .DOTFILES FOLDER IS NOT INSTALLED."
    echo " ==> PLEASE FIX IT. "
    echo " ==> I QUIT. "
    echo
    echo
    exit 1
fi

# Unlock quarantaine mode for apps
sh .macos-unlocker

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure everythin is working properly
brew doctor

# Install and upgrade (by default) cli-tools, apps from the Brewfile (.brewfile).
brew bundle --file=.brewfile

# Install Irvue wallpaper manager from App Store
mas install 1039633667

# FIXME
#./oh-my-zsh.sh

# Git configuration
echo 
echo 
echo " 👉👉👉 Git configuration (.gitsettings)"
echo 
echo 

sh .gitsettings


echo 
echo 
echo " 👉👉👉 macOS configuration (.macos*)"
echo 
echo 

sh .macos
sh .macos-user-defaults
sh .macos-paulirish
sh .macos-dock


echo 
echo 
echo " 👉👉👉 Reload applications"
echo 
echo 

killall Dock
killall Finder

# VSCodium extensions
echo 
echo 
echo " 👉👉👉 VSCodium extensions (.vscodium)"
echo 
echo 

sh .vscodium

# Done
echo
echo
echo " 👉👉👉 INSTALLATION DONE"
echo
echo "Don't forget to run `mackup restore`"
echo
echo " 👉👉👉 KTHXBAI"
echo
