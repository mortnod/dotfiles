#!/bin/bash

source 'settings.sh'
source 'utils.sh'

install_xcode_select() {
  print_info "Installing Xcode Command Line Tools (This might take a few minutes)"

  if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
      print_success "Oh! Seems like the Xcode tools were already installed ¯\_(ツ)_/¯\n"
  else
      touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
      PROD=$(softwareupdate -l |
          grep "\*.*Command Line" |
          head -n 1 | awk -F"*" '{print $2}' |
          sed -e 's/^ *//' |
          tr -d '\n')
      softwareupdate -i "$PROD" --verbose;

      print_success "Xcode Command Line Tools successfully installed\n";
  fi
}

install_brew() {
    print_info "Installing Homebrew"
    if ! which brew > /dev/null; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        print_info "Running brew doctor"
        brew doctor
        print_info "Setting up brew cask"
        brew tap caskroom/cask
        print_success "Homebrew successfully installed\n"
    else
        print_success "Oh! Homebrew was already installed!\n"
    fi
}

install_brew_packages() {
    print_info "Installing essential homebrew packages:"
    print_list $@
    brew install "$@"
    print_success "Brew packages successfully installed\n"
}

print_heading "Install prerequisites"
install_xcode_select
install_brew
install_brew_packages $ESSENTIAL_BREW_PACKAGES
