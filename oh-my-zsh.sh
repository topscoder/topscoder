#!/bin/bash

# Install oh-my-zsh
# https://ohmyz.sh/#install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Find and replace the plugins line with this one
# See for more plugins: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# plugins=(git colored-man-pages colorize pip python brew osx)

# Zsh Plugin Manager
brew install zplug

# if [[ ! -f "$ZPLUG_HOME/init.zsh" ]]
# then
#     echo "Cannot find $ZPLUG_HOME/init.zsh. Exiting."
#     exit 1
# fi

# Only if it is not already installed
if grep -Fxq "Added by automated" ~/.zshrc
then
    echo "ZPLUG HOME Already added to .zshrc"
else
    echo "" >> ~/.zshrc
    echo "# Added by automated macos setup tool topscoder/topscoder" >> ~/.zshrc
    echo "export ZPLUG_HOME=/usr/local/opt/zplug" >> ~/.zshrc
    echo "source \$ZPLUG_HOME/init.zsh" >> ~/.zshrc
    echo "" >> ~/.zshrc
fi

source ~/.zshrc

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
#zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# FIXME
# zplug "themes/robbyrussell", from:oh-my-zsh, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose