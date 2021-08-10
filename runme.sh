#!/bin/bash

source ./utils.sh

# Install XCode Developer Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi
##############################################################################################################

# Ask for the administrator password upfront
sudo -v

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure everythin is working properly
brew doctor

# Only clone if .dotfiles are not installed already
if ! [[ $(pwd) =~ (\.dotfiles$) ]];
then
    brew install git
    git clone https://github.com/topscoder/topscoder.git ./.dotfiles/
    cd .dotfiles/
fi

# Install and upgrade (by default) all dependencies from the Brewfile (.brewfile).
brew bundle --file=.brewfile

# Unlock quarantaine mode for apps
sh .macos-unlocker

# Install Irvue wallpaper manager from App Store
mas install 1039633667

# FIXME
#./oh-my-zsh.sh

# System settings
sh .macos
sh .macos-user-defaults
sh .macos-paulirish
python3 .macos-dock

# Application specific settings
sh .codium

# Done
echo
echo "-- Installation done --"
echo
echo "Don't forget to use `mackup restore`"
echo
echo "-- KTHXBAI --"
echo
