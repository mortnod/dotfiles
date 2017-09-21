#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

print_heading "Node"
printf "Here are some NPM packages that might be of use to you:\n"
for package in $NPM_PACKAGES; do
    printf "  * $package\n"
done

printf "\n" # An extra line break, purely for cosmetic reasons

if ask_question "Do you want to install them?"; then
    sudo npm install -g $NPM_PACKAGES
    print_result $? "Install NPM packages"
else
    print_error "Got it. No NPM packages for you."
fi
