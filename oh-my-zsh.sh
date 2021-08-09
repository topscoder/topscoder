#!/bin/bash

# Install oh-my-zsh
# https://ohmyz.sh/#install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Find and replace the plugins line with this one
# See for more plugins: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# plugins=(git colored-man-pages colorize pip python brew osx)
sed -i 's/\b(plugins).*?\)$\b/plugins=(git)/gi' ~/.zshrc

source ~/.zshrc