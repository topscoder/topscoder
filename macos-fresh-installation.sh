#!/bin/sh

# Install XCode Developer Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages (default -cli- applications)
brew install git docker docker-compose mackup zsh zsh-async zsh-history-substring-search

# Install brew cask packages (cask = gui applications)
brew install --cask bitwarden commander-one discord keepingyouawake kitty rectangle rocket ubersicht vscodium 

# VSCodium extensions
# Auto Close Tag
# Auto Rename Tag
# Better Comments
# Bracket Pair Colorizer
# Diff
# Emoji Log
# Fluent Icons
# Git Lens
# indent-rainbow
# Jetbrains IDE Keymap
# MagicPython
# Noctis
# Prettier
# Settings Sync
# Tabnine
# TODO Highlight

# Install nerd font
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip

# Install oh-my-zsh
# https://ohmyz.sh/#install

# Shell prompt
# npm install -g typewritten

# noctis color scheme for:
# - kitty terminal
# - vscodium
# - typewritten
# - zsh?

# Set zsh plugins
# plugins=(
#   git
#   bundler
#   dotenv
#   osx
#   rake
#   rbenv
#   ruby
# )

# Set zsh theme
# https://github.com/ohmyzsh/ohmyzsh

# Restore settings using mackup sync
# mackup restore
