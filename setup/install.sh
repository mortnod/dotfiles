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
    print_success "Great! Let's begin!\n"
else
    print_error "No worries. Just run this script again when your done."
    exit 0
fi

# Get sudo from user
print_info "You might need to input your sudo password"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

################################################
print_heading "Install prerequisites"
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

install_brew # Install the "brew" command
install_brew_packages $ESSENTIAL_BREW_PACKAGES

#############################################
print_heading "Fish"
print_in_gray "Fins down the best shell in the tunaverse! (sorry)\n\n"

print_info "Creating symlinks to the dotfiles"
install_dotfiles "../dotfiles/fish/config/" ~/.config/fish/ false
install_dotfiles "../dotfiles/fish/functions/" ~/.config/fish/functions/ false
install_dotfiles "../dotfiles/universal/"

print_info "Setting Fish as default shell"
# If "/usr/local/bin/fish" isn't already in "/etc/shells", add it to the list"
grep -q -F '/usr/local/bin/fish' '/etc/shells' || echo '/usr/local/bin/fish' | sudo tee -a '/etc/shells'

# Set fish as default shell
chsh -s /usr/local/bin/fish
print_success "Fish successfully set as default shell\n"

print_info "Installing fisherman (package manager)"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
print_success "Fisherman successfully installed\n"

print_info "Installing fisherman packages:"
print_list $FISHERMAN_PACKAGES
/usr/local/bin/fish -i -c "fisher install $FISHERMAN_PACKAGES"
print_success "Fisherman packages successfully installed\n"

print_info "Installing re-search (backwards search using CTRL+R or arrow keys)"
install_re_search
print_success "Re-search successfully installed"

#############################################
print_heading "Bash"
echo "If you want, we can make Bash a bit better as well. Fish will still be the default shell, so this will only be useful if you sometimes want to use bash instead of fish\n"

if ask_question "Add Bash support?"; then
    install_dotfiles "../dotfiles/bash/"
else
    print_error "Good riddance!"
fi

#############################################
print_heading "Git"
echo "To setup Git properly you'll need to specify your name and email\n"

print_info "Found the following name and email in settings.sh:"
print_in_blue "      * Name: $GIT_NAME\n"
print_in_blue "      * Email: $GIT_EMAIL\n"


if ask_question "Use the name and email mentioned above?"; then
    git config --global user.name $GIT_NAME
    git config --global user.email $GIT_EMAIL
    print_success "Name and email set successfully"
else
    print_question "Enter your full name: "
    read -r GIT_CUSTOM_NAME </dev/tty

    print_question "Enter your email: "
    read -r GIT_CUSTOM_EMAIL </dev/tty

    git config --global user.name "$GIT_CUSTOM_NAME"
    git config --global user.email "$GIT_CUSTOM_EMAIL"
    print_success "Name and email set successfully"
fi

##################################################
print_heading "Hyper"
echo "Hyper is a pretty slick terminal app. This setup will..."
echo "  * Install Hyper"
echo "  * Install HPM (Hyper Package Manager)"
echo "  * Install a snazzy theme"
echo "  * Install some nifty plugins, such as 1Password support\n"

if ask_question "Do you want to install Hyper?"; then
    print_info "Installing Hyper"
    brew cask install hyper

    print_info "Installing HPM (Hyper Package Manager)"
    npm install hpm-cli

    print_info "Installing Packages:"
    print_list $HPM_PACKAGES
    for package in $HPM_PACKAGES; do
        hpm install $package
    done

    print_in_yellow "To activate 1Password support, go to 1Password → Preferences → Advanced and untick 'Verify browser code signature'\n"
    print_success "Hyper is ready to roll!"
else
    print_error "Fine. It's your choice... ಠ_ಠ"
fi


##################################################
print_heading "Node"
echo "Here are some NPM packages that might be of use to you:"
for package in $NPM_PACKAGES; do
    echo "  * $package"
done

echo "" # An extra line break, purely for cosmetic reasons

if ask_question "Do you want to install them?"; then
    npm install -g $NPM_PACKAGES
    print_success "NPM packages successfully installed"
else
    print_error "Got it. No NPM packages for you."
fi

################################################
print_heading "macOS tweaks"
echo "There are lots of tweaks that can make macOS much more pleasant. Here are some examples:"
echo "  * Enable Tab in modal dialogs"
echo "  * Expand save panel by default"
echo "  * Enable tap to click (on the trackpad)"
echo "  * Use CTRL + scroll gesture to zoom (regardless of app your in)"
echo "  * Disable the “Are you sure you want to open this application?” dialog"

echo "\nHowever, there are a lot of them (about 100 tweaks) and not all of them might appeal to you. I recommend that you take a look at \"setup/macos.sh\" to remove the tweaks you're not interested in before going further\n"

if ask_question "Activate macOS tweaks?"; then
    install_macos
    print_success "macOS successfully tweaked!"
else
    print_error "Oh well. I'm sure the tweaks weren't that cool anyways..."
fi

################################################
print_heading "Applications"
echo "It is a real hassle having to reinstall all your applications (such as Chrome and Dropbox) after a system wipe. Let me do the job for you ;)\n"

print_info "The following applications are ready to be installed (with brew cask):"
print_list $BREW_CASKS
echo ""

if ask_question "Do you want to install the applications listed above?"; then
    install_brew_casks $BREW_CASKS
else
    print_error "That's fine. If you want to adjust which applications to install, just edit 'setup/settings.sh'"
fi

################################################
print_in_green "\n----------------------------------------\n"
print_in_green "Hurray! The installation is finished! 🎉\n"
print_in_green "----------------------------------------\n"
