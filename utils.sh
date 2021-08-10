#!/bin/bash

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