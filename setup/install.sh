source 'settings.sh'
source 'utils.sh'
source 'brew.sh'
source 'dotfiles.sh'
source 're_search.sh'
source 'macos.sh'

##############################################
# Ensure that script is run on macOS
if ! [ "$(uname)" == "Darwin" ]; then
    print_error "Sorry! This script only supports macOS"
    exit 2
fi

##############################################
print_heading "Dotfiles installation"

print_info "Before continuing the installation, make sure you..."
print_in_blue "        1. Update 'setup/settings.sh' to your tastes\n"
print_in_blue "        2. Look through 'setup/macos.sh' and remove any unwanted changes\n"

if ask_question "Have you done all of the above?"; then
   print_success "Great! Let's begin!"
else
   print_error "No worries. Just run this script again when your done."
   exit 0
fi

# Get sudo from user
print_info "You might need to input your sudo password"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

################################################
print_heading "Install Xcode Command Line Tools"

print_info "This might take a few minutes"

if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
   print_success "Oh! Seems like the tools were already installed"
else
   touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
   PROD=$(softwareupdate -l |
      grep "\*.*Command Line" |
      head -n 1 | awk -F"*" '{print $2}' |
      sed -e 's/^ *//' |
      tr -d '\n')
   softwareupdate -i "$PROD" --verbose;

   print_success "Successfully installed the command line tools";
fi

#############################################
print_heading "Symlink dotfiles - Fish"
print_info "Creating symlinks"
install_dotfiles "../dotfiles/fish/config/" ~/.config/fish/ false
install_dotfiles "../dotfiles/fish/functions/" ~/.config/fish/functions/ false

print_heading "Symlink dotfiles - Universal"
print_info "Creating symlinks"
install_dotfiles "../dotfiles/universal/"

print_heading "Symlink dotfiles - Bash (legacy)"
if ask_question "Create symlinks to bash dotfiles? (Only needed when using bash instead of fish)"; then
   install_dotfiles "../dotfiles/bash/"
else
   print_error "Good riddance!"
fi

##############################################
print_heading "Fish"

print_info "Setting fish as default shell"
# If "/usr/local/bin/fish" isn't already in "/etc/shells", add it to the list"
grep -q -F '/usr/local/bin/fish' '/etc/shells' || echo '/usr/local/bin/fish' | sudo tee -a '/etc/shells'

# Set fish as default shell
chsh -s /usr/local/bin/fish
print_success "Fish successfully set as default shell\n"

print_info "Installing fisherman (package manager)"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
print_success "Fisherman successfully installed\n"

print_info "Installing fisherman packages: $FISHERMAN_PACKAGES"
/usr/local/bin/fish -i -c "fisher install $FISHERMAN_PACKAGES"
print_success "Fisherman packages successfully installed\n"

print_info "Installing re-search (backwards search using CTRL+R or arrow keys)"
install_re_search
print_success "Re-search successfully installed"

#############################################
print_heading "Git"
print_info "Setting Git user information"
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
print_success "Name → $GIT_NAME"
print_success "Email → $GIT_EMAIL"

#############################################
print_heading "Homebrew"
install_brew # Install the "brew" command
install_brew_packages $BREW_PACKAGES
install_essential_brew_casks $ESSENTIAL_BREW_CASKS

if ask_question "Do you want to install the following casks: $OPTIONAL_BREW_CASKS?"; then
    install_optional_brew_casks $OPTIONAL_BREW_CASKS
else
    print_error "That's fine. If you want to adjust which casks to install, just edit 'settings.sh'"
fi

##################################################
print_heading "Node"
print_info "Installing NPM packages: $NPM_PACKAGES"
npm install -g $NPM_PACKAGES
print_success "NPM packages successfully installed"

##################################################
print_heading "Hyper packages"
print_info "Installing hyper packages: $HPM_PACKAGES"
for package in $HPM_PACKAGES; do
  hpm install $package
done
print_in_yellow "To activate 1Password support, go to 1Password → Preferences → Advanced and untick 'Verify browser code signature'\n"

print_success "Hyper packages successfully installed"

################################################
print_heading "Better macOS defaults"
print_info "There are LOTS of tweaks that can be done to make macOS much more pleasant. However, you should REALLY take a look at \"setup/macos.sh\" before going further."

if ask_question "Set better macOS defaults?"; then
   install_macos
   print_success "macOS defaults successfully changed"
else
   print_error "Oh well. I'm sure the tweaks weren't that cool anyways..."
fi

################################################
print_in_green "\n----------------------------------------\n"
print_in_green "Hurray! The installation is finished! 🎉\n"
print_in_green "----------------------------------------"
