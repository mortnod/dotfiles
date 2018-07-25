# Activate the aliases
source ~/.config/fish/aliases.fish

# Source local settings (if the exist)
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# Use a newer version of coreutils (includes cat, cp, chmod, ls, mv and so on)
# Requires: brew install coreutils
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# Start virtualfish (to automatically activate python virtualenvs)
eval (python -m virtualfish auto_activation)

# Color highlighting inside manpages (and elsewhere)
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# Start pyenv: Used to easily switch between multiple versions of Python
status --is-interactive; and source (pyenv init -|psub)

set -gx  LC_ALL en_US.UTF-8
set -gx  LANG en_US.UTF-8
