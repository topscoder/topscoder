#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils

# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# GNU `sed`
brew install gnu-sed

# Install more recent versions of some OS X tools
brew install vim
brew install nano
brew install grep
brew install openssh

# better `top`
brew install glances

# See: https://sourabhbajaj.com/mac-setup/BashCompletion/
brew install bash-completion@2

# Install homebrew packages (default -cli- applications)
brew install git

# See: https://github.com/git-friendly/git-friendly
brew install git-friendly/git-friendly/git-friendly

brew install docker
brew install docker-compose
brew install mackup
brew install zsh
brew install zsh-async
brew install zsh-history-substring-search

# Remove outdated versions from the cellar
brew cleanup