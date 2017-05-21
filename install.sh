#!/bin/bash

source 'setup/utils.sh'

# Ensure that script is run on macOS
mac_or_die() {
    if ! [ "$(uname)" == "Darwin" ]; then
        print_error "Sorry! This script only supports macOS"
        exit 2
    fi
}

print_welcome_message() {
    print_heading "Dotfiles installer"
    printf "Before we start, be sure to modify "
    print_in_blue "settings.sh"
    printf " to fit your needs. It contains lots of preferences that we'll use throughout the installer\n\n"

    if ask_question "Are you done editing settings.sh?"; then
        print_success "Great! Let's begin!\n"
    else
        print_error "No worries. Just run this script again when your done."
        exit 0
    fi
}

# Get sudo from user
ask_for_sudo() {
    print_info "You might need to input your sudo password"
    sudo -v
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

macos_tweaks() {
    # There is a reason why the header and all the text is put here (instead of inside the macos.sh file):
    # By waiting to launch ./macos.sh until the user has been asked, the user can actually edit
    # the macos file until they answer yes.

    # In other words: The user can change settings in macos.sh right up until the moment it's executed
    print_heading "macOS tweaks"
    printf "There are lots of tweaks that can make macOS much more pleasant. Here are some examples:\n"
    printf "  * Enable Tab in modal dialogs\n"
    printf "  * Expand save panel by default\n"
    printf "  * Enable tap to click (on the trackpad)\n"
    printf "  * Use CTRL + scroll gesture to zoom (regardless of app your in)\n"
    printf "  * Disable the “Are you sure you want to open this application?” dialog\n\n"

    printf "However, there are a lot of them (about 100 tweaks) and not all of them might appeal to you. I recommend that you take a look at "
    print_in_blue "\"setup/macos.sh\" "
    printf "to remove the tweaks you're not interested in before going further\n\n"

    if ask_question "Activate macOS tweaks?"; then
        ./setup/macos.sh
        print_success "macOS successfully tweaked!"
    else
        print_error "Oh well. I'm sure the tweaks weren't that cool anyways..."
    fi
}

print_goodbye() {
    print_in_green "\n----------------------------------------\n"
    print_in_green "Hurray! The installation is finished! 🎉\n"
    print_in_green "----------------------------------------\n"
}

mac_or_die
print_welcome_message
ask_for_sudo

./setup/prerequisites.sh
./setup/fish.sh
./setup/bash.sh
./setup/vim.sh
./setup/git.sh
./setup/hyper.sh
./setup/node.sh
macos_tweaks
./setup/applications.sh

print_goodbye
