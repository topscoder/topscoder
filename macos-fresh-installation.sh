#!/bin/sh

# Install XCode Developer Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages (default -cli- applications)
brew install git docker docker-compose mackup zsh zsh-async zsh-history-substring-search

# Install brew cask packages (cask = gui applications)
brew install --cask bitwarden commander-one discord eloston-chromium keepingyouawake kitty rectangle rocket the-unarchiver ubersicht vscodium 

# VSCodium extensions
# https://code.visualstudio.com/docs/editor/command-line
codium --install-extension "formulahendry.auto-close-tag" --force; 
codium --install-extension "formulahendry.auto-rename-tag" --force; 
codium --install-extension "aaron-bond.better-comments" --force; 
codium --install-extension "CoenraadS.bracket-pair-colorizer" --force; 
codium --install-extension "ryu1kn.partial-diff" --force; 
codium --install-extension "ahmadawais.emoji-log-vscode" --force; 
codium --install-extension "miguelsolorio.fluent-icons" --force; 
codium --install-extension "eamodio.gitlens" --force; 
codium --install-extension "oderwat.indent-rainbow" --force; 
codium --install-extension "isudox.vscode-jetbrains-keybindings" --force; 
codium --install-extension "ms-python.python" --force; 
codium --install-extension "svipas.prettier-plus" --force; 
codium --install-extension "Shan.code-settings-sync" --force; 
codium --install-extension "TabNine.tabnine-vscode" --force; 
codium --install-extension "jgclark.vscode-todo-highlight" --force; 
codium --install-extensino "rangav.vscode-thunder-client" --force;

curl https://marketplace.visualstudio.com/_apis/public/gallery/publishers/liviuschera/vsextensions/noctis/10.40.0/vspackage --output liviuschera.noctis.vsix; 
codium --install-extension liviuschera.noctis.vsix --force;
  
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
