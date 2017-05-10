#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/bash/"
}

print_heading "Bash"
printf "If you want, we can make Bash a bit better as well. Fish will still be the default shell, so this will only be useful if you sometimes want to use bash instead of fish\n\n"

if ask_question "Add Bash support?"; then
    create_symlinks
else
    print_error "Good riddance!"
fi
