#!/bin/bash

### Run install scripts
./macos-fresh-installation.sh
./brew.sh
./brew-cask.sh
#./oh-my-zsh.sh

# autocompletion for git branch names https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open

# install better nanorc config
# https://github.com/scopatz/nanorc
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash

sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# install nvm (Node Version Nanager, https://github.com/nvm-sh/nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# System settings
./macos.sh
./macos-user-defaults.sh
./macos-dock.sh

git config --global user.name "topscoder"
git config --global user.email "topscoder@gmail.com"

# Application settings
./codium.sh