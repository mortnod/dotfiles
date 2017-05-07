source 'utils.sh'

install_brew() {
    print_info "Installing Homebrew"
    if ! which brew > /dev/null; then
        print_info "Not installed, installing.."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        print_info "Running brew doctor.."
        brew doctor
        print_success "Homebrew successfully installed\n"
    else
        print_success "Oh! Homebrew was already installed!\n"
    fi
}

install_brew_packages() {
    print_info "Installing brew packages: $*"
    brew install "$@"
    print_success "Brew packages successfully installed\n"
}

install_essential_brew_casks() {
    print_info "Installing essential casks: $*"
    brew tap caskroom/cask
    brew cask install "$@"
    print_success "Essential casks successfully installed\n"
}

install_optional_brew_casks() {
    print_info "Installing optional casks"
    brew cask install "$@"
    print_success "Optional casks successfully installed"
}
