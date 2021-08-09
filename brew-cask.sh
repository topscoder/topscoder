#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install native GUI applications using brew --cask
brew install --cask bitwarden
brew install --cask commander-one
brew install --cask discord
brew install --cask dropbox
brew install --cask eloston-chromium
brew install --cask keepingyouawake
brew install --cask kitty
brew install --cask rectangle
brew install --cask rocket
#brew install --cask the-unarchiver
brew install --cask ubersicht
brew install --cask vscodium
brew install --cask appcleaner
brew install --cask vmware-fusion

# Free Database Management Tool
#brew install --cask valentina-studio

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-fantasque-sans-mono-nerd-font

# Quick Look Plugins
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask qlprettypatch
brew install --cask quicklook-csv
brew install --cask betterzip
brew install --cask webpquicklook
brew install --cask suspicious-package