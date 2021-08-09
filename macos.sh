#!/bin/bash

# git config
git config --global user.name "topscoder"
git config --global user.email "topscoder@gmail.com"

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


# Remove workspace auto-switching
sudo defaults write com.apple.dock workspaces-auto-swoosh -bool NO
killall Dock # Restart the Dock process

# Change the default folder for screenshots
# Open the terminal and create the folder where you would like to store your screenshots:
# mkdir -p /path/to/screenshots/
# defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer


# ==============================================
# Date & Time
# ==============================================

sudo /usr/sbin/systemsetup -settimezone "Europe/Amsterdam"
sudo /usr/sbin/systemsetup -setnetworktimeserver "time.euro.apple.com"
sudo /usr/sbin/systemsetup -setusingnetworktime on
sudo /usr/sbin/sysadminctl -automaticTime on


# ==============================================
# Set energy preferences
# ==============================================

# From <https://github.com/rtrouton/rtrouton_scripts/>
IS_LAPTOP=$(/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier" | grep "Book")
if [[ "$IS_LAPTOP" != "" ]]; then
    sudo pmset -b sleep 15 disksleep 10 displaysleep 5 halfdim 1
    sudo pmset -c sleep 0 disksleep 0 displaysleep 30 halfdim 1
else
    sudo pmset sleep 0 disksleep 0 displaysleep 30 halfdim 1
fi


# ==============================================
# Application layer firewall
# ==============================================

# Enable ALF
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Allow signed apps
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool true

# Enable logging
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool true

# Disable stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool false


# ==============================================
# Login window
# ==============================================

# Display login window as: Name and password
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool true

# Show shut down etc. buttons
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

# Don't show any password hints
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

# Allow fast user switching
sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool true

# Hide users with UID under 500
sudo defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool true

# Show input menu
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Disable screensaver on login window
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime -int 0

# Disable automatic login
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser > /dev/null 2>&1


# ==============================================
# Software update
# ==============================================

# Enable automatic update check and download
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# Enable app update installs
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

# Enable system data files and security update installs
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# Enable OS X update installs
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool true

# Enable key repeat
sudo defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE

# Set keyboard repeat rate
sudo defaults write NSGlobalDomain KeyRepeat -int 2

# Set scroll direction
sudo defaults write /Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false


# ==============================================
# Time Machine
# ==============================================

# Don't offer new disks for backup
sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


# ==============================================
# Guest access off
# ==============================================
sudo /usr/sbin/sysadminctl -guestAccount off
sudo /usr/sbin/sysadminctl -afpGuestAccess off
sudo /usr/sbin/sysadminctl -smbGuestAccess off

echo 
echo "Done running macos.sh. Note that these changes require a restart to take effect."
echo