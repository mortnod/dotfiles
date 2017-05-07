source 'utils.sh'

install_optional_brew_casks() {
    print_info "Installing applications"
    brew cask install "$@"
    print_success "Applications successfully installed"
}
