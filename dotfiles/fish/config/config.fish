# Activate the aliases
source ~/.config/fish/aliases.fish

# Source local settings (if the exist)
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# On ARM based macs, we need to provide path to brew binaries manually
set -gx PATH /opt/homebrew/bin $PATH

# Use a newer version of coreutils (includes cat, cp, chmod, ls, mv and so on)
# Requires: brew install coreutils
set -gx PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH



# Color highlighting inside manpages (and elsewhere)
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Fish syntax highlighting
# https://fishshell.com/docs/current/index.html#variables-color

set -gx fish_color_normal blue
set -gx fish_color_command white --bold
set -gx fish_color_quote yellow
set -gx fish_color_redirection cyan
set -gx fish_color_end magenta
set -gx fish_color_error red
set -gx fish_color_param blue
set -gx fish_color_autosuggestion 828484
set -gx fish_color_match green
set -gx fish_color_operator magenta
set -gx fish_color_escape magenta
# set -gx fish_color_comment
# set -gx fish_color_selection
# set -gx fish_color_search_match
# set -gx fish_color_cwd
# set -gx fish_color_user
# set -gx fish_color_host
# set -gx fish_color_cancel
# set -gx fish_pager_color_prefix
# set -gx fish_pager_color_completion
# set -gx fish_pager_color_description
# set -gx fish_pager_color_progress
# set -gx fish_pager_color_secondary

# Pure prompt tweaks
set -gx pure_color_prompt_on_success (set_color green)

# Start pyenv: Used to easily switch between multiple versions of Python
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Go (for Konfidens)
set -gx GOPATH "$HOME/go"
set -gx PATH $GOPATH/bin $PATH

# n without sudo
set -gx N_PREFIX "$HOME/.n"
set -gx PATH "$HOME/.n/bin" $PATH

# Some aws fuckery
set -gx AWS_VAULT_BACKEND keychain
set -gx AWS_VAULT_KEYCHAIN_NAME aws-vault