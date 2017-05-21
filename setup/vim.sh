#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

install_vimplug() {
  print_info "Installing vim-plug (plugin manager)"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  print_result $? "Install vim-plug\n"
}

install_plugins() {
  print_info "Installing plugins"

  # Make sure that the user gets time to read the message above
  # (The install command will go into fullscreen and the message above will disappear)
  sleep 2

  vim +PlugInstall +qall
  print_result $? "Install plugins"
}

print_heading "Vim"
install_vimplug
install_plugins
