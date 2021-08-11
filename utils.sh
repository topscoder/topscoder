#!/usr/bin/env bash

#################################################################################
# File  	    :   utils.sh
# Description	:   Install XCode Developer Tools
# Args         	:   
# Dependencies  :   sudo
# Author       	:   github.com/alrra, topscoder
# Email         :   
#################################################################################
# See https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi
##############################################################################################################


log_note() {
    echo "`date` - $1" >> notes.log
}

log_info() {
    echo "`date` - $1" >> runme.log
}

clear_logs() {
    echo "" > notes.log
    echo "" > runme.log
}

print_in_green() {
    printf "\e[0;32m$1\e[0m"
}

print_success() {
    print_in_green "  [✔] $1\n"
}

print_error() {
    print_in_red "  [✖] $1 $2\n"
}

print_in_red() {
    printf "\e[0;31m$1\e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    return $1
}

start_block() {
    echo ""
    print_in_green "`date` 👉  $1 \n"
}

finish_block() {
    print_in_green "`date` 🏁  $1 \n"
    echo ""
}