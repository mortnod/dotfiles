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
    # If "/opt/homebrew/bin/fish" isn't already in "/etc/shells", add it to the list"
    grep -q -F $(brew --prefix)'/bin/fish' '/etc/shells' || echo $(brew --prefix)'/bin/fish' | sudo tee -a '/etc/shells'
}

install_fisher() {
    print_info "Installing fisherman (package manager)"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    print_result $? "Install fisherman\n"
}

install_fisher_packages() {
    print_info "Installing fisherman packages:"
    print_list $FISHER_PACKAGES
    /opt/homebrew/bin/fish -c "fisher install $FISHER_PACKAGES"
    print_result $? "Install fisherman packages\n"
}

install_re_search() {
    print_info "Installing re-search (backwards search using CTRL+R or arrow keys)"

    curl https://codeload.github.com/jbonjean/re-search/tar.gz/HEAD | tar -xzC ~/.config/
    mv re-search-HEAD re-search
    make -C ~/.config/re-search
    chmod +x ~/.config/re-search
    chmod +x ~/.config/re-search/re-search
    ln -s ~/.config/re-search $(brew --prefix)/bin/re-search

    print_result $? "Install re-search\n"
}

set_fish_as_default_shell() {
    if ask_question "Do you want to set Fish as your default shell?"; then
        # Set fish as default shell
        chsh -s $(brew --prefix)/bin/fish
        print_result $? "Set Fish as default shell\n"
    else
        print_error "Alright. When the installer is finished, you can type 'fish' in the terminal to test it without setting it as your default"
    fi
}


print_heading "Fish"
print_in_gray "Fins down the best shell in the tunaverse! (sorry)\n\n"

create_symlinks
add_fish_as_allowed_shell
install_fisher
install_fisher_packages
install_re_search
set_fish_as_default_shell
