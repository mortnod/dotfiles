#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the dotfiles"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/config/" ~/.config/fish/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/functions/" ~/.config/fish/functions/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/universal/"
    printf "\n"
}

add_fish_as_allowed_shell() {
    # Add fish to /etc/shells (the list of allowed shells)
    # If "/usr/local/bin/fish" isn't already in "/etc/shells", add it to the list"
    grep -q -F '/usr/local/bin/fish' '/etc/shells' || echo '/usr/local/bin/fish' | sudo tee -a '/etc/shells'
}

install_fisherman() {
    print_info "Installing fisherman (package manager)"
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    print_success "Fisherman successfully installed\n"
}

install_fisherman_packages() {
    print_info "Installing fisherman packages:"
    print_list $FISHERMAN_PACKAGES
    /usr/local/bin/fish -c "fisher install $FISHERMAN_PACKAGES"
    print_success "Fisherman packages successfully installed\n"
}

install_re_search() {
    print_info "Installing re-search (backwards search using CTRL+R or arrow keys)"

    make -C ~/.config/fisherman/re-search
    chmod +x ~/.config/fisherman/re-search/re-search
    ln -s ~/.config/fisherman/re-search/re-search /usr/local/bin/re-search

    print_success "Re-search successfully installed\n"
}

set_fish_as_default_shell() {
    if ask_question "Do you want to set Fish as your default shell?"; then
        # Set fish as default shell
        chsh -s /usr/local/bin/fish
        print_success "Fish successfully set as default shell\n"
    else
        print_error "Alright. When the installer is finished, you can type 'fish' in the terminal to test it without setting it as your default"
    fi
}


print_heading "Fish"
print_in_gray "Fins down the best shell in the tunaverse! (sorry)\n\n"

create_symlinks
add_fish_as_allowed_shell
install_fisherman
install_fisherman_packages
install_re_search
set_fish_as_default_shell
