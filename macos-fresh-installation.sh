#!/bin/sh

# Install XCode Developer Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages (default -cli- applications)
brew install git docker docker-compose mackup zsh zsh-async zsh-history-substring-search

# Install brew cask packages (cask = gui applications)
brew install --cask bitwarden commander-one discord eloston-chromium keepingyouawake kitty rectangle rocket ubersicht vscodium 

# VSCodium extensions
# https://code.visualstudio.com/docs/editor/command-line
export code_extensions = "formulahendry.auto-close-tag 
    formulahendry.auto-rename-tag 
    aaron-bond.better-comments 
    CoenraadS.bracket-pair-colorizer	 
    ryu1kn.partial-diff 
    ahmadawais.emoji-log-vscode 
    miguelsolorio.fluent-icons  
    eamodio.gitlens 
    oderwat.indent-rainbow 
    isudox.vscode-jetbrains-keybindings 
    ms-python.python 
    liviuschera.noctis 
    svipas.prettier-plus 
    Shan.code-settings-sync 
    TabNine.tabnine-vscode 
    jgclark.vscode-todo-highlight"

for extension in $code_extensions;
do
    codium --install-extension --force $extension;
done

# Experimental
codium --install-extension \ 
  sourcery.sourcery \
  ponicode.ponicode \
  CodeStream.codestream \
  Stepsize.stepsize
  
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
