#!/bin/bash

# Install XCode Developer Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

print_in_green() {
    printf "\e[0;32m$1\e[0m"
}

print_success() {
    print_in_green "  [✔] $1\n"
}

print_error() {
    print_in_red "  [✖] $1 $2\n"
}

print_in_red() {
    printf "\e[0;31m$1\e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    return $1
}

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

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure everythin is working properly
brew doctor

brew install git

git clone https://github.com/topscoder/topscoder.git ./dotfiles/

cd .dotfiles/

# Install and upgrade (by default) all dependencies from the Brewfile (.brewfile).
brew bundle --file=.brewfile

# FIXME
#./oh-my-zsh.sh

# System settings
sh .macos
sh .macos-user-defaults
sh .macos-paulirish
python .macos-dock

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
