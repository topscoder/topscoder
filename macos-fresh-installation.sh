#!/bin/sh

# Install XCode Developer Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages
brew install git docker docker-compose mackup zsh zsh-async zsh-history-substring-search

# Install brew cask packages
brew install --cask bitwarden commander-one discord keepingyouawake kitty rectangle rocket vscodium 

# nerd font
# install oh-my-zsh ?

# Shell prompt
# npm install -g typewritten

# noctis color scheme for:
# - kitty terminal
# - vscodium
# - typewritten
# - zsh?

# Restore settings using mackup sync
# mackup restore
