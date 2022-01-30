#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

install_applications() {
    print_info "Installing applications"
    brew install --cask "$@"
    print_result $? "Install applications"
}

print_heading "Applications"
printf "It is a real hassle having to reinstall all your applications (such as Chrome and Dropbox) after a system wipe. Let me do the job for you ;)\n\n"

print_info "The following applications are ready to be installed (with brew cask):"
print_list $BREW_CASKS
printf "\n"

if ask_question "Do you want to install the applications listed above?"; then
    install_applications $BREW_CASKS
else
    print_error "That's fine. If you want to adjust which applications to install, just edit 'setup/settings.sh'"
fi
