#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

print_heading "Git"
printf "To setup Git properly you'll need to specify your name and email\n\n"

print_info "Found the following name and email in settings.sh:"
print_in_blue "      * Name: $GIT_NAME\n"
print_in_blue "      * Email: $GIT_EMAIL\n"

if ask_question "Use the name and email mentioned above?"; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
else
    print_question "Enter your full name: "
    read -r GIT_CUSTOM_NAME </dev/tty

    print_question "Enter your email: "
    read -r GIT_CUSTOM_EMAIL </dev/tty

    git config --global user.name "$GIT_CUSTOM_NAME"
    git config --global user.email "$GIT_CUSTOM_EMAIL"
fi

print_result $? "Set git name and email"
