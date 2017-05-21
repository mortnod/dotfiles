#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

install_hyper() {
    print_info "Installing Hyper"
    brew cask install hyper
    print_result $? "Install Hyper\n"
}

install_hpm() {
    print_info "Installing HPM (Hyper Package Manager)"
    npm install -g hpm-cli
    print_result $? "Install HPM\n"
}

install_hyper_packages() {
    print_info "Installing Packages:"
    print_list $HPM_PACKAGES
    for package in $HPM_PACKAGES; do
        hpm install $package
    done

    print_in_yellow "To activate 1Password support, go to 1Password → Preferences → Advanced and untick 'Verify browser code signature'\n"
    print_result $? "Install HPM packages\n"

}

print_heading "Hyper"
printf "Hyper is a pretty slick alternative to iTerm and Terminal. This setup will...\n"
printf "  * Install Hyper\n"
printf "  * Install HPM (Hyper Package Manager)\n"
printf "  * Install a snazzy theme\n"
printf "  * Install some nifty plugins, such as 1Password support\n\n"

if ask_question "Do you want to install Hyper?"; then
    install_hyper
    install_hpm
    install_hyper_packages
else
    print_error "Fine. It's your choice... ಠ_ಠ"
fi
