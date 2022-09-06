# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# git shortcuts
alias ga='git add'
alias gaa='git add .'

alias gcm='git commit -m'
alias gcam='git commit -am'

alias gs='git s'

alias gd='git diff'
alias gds='git diff --staged'

alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gpf='git push --force-with-lease'

alias grh='git reset --hard HEAD'

alias gl='git lg'

alias gst='git stash'
alias gsta='git stash-all'
alias gstp='git stash pop'



# Edit hosts file
alias hosts='sudo vim /etc/hosts'

# Check free diskspace
alias diskspace_report="df -P -kHl"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Run previous command with sudo
function sudo!!
    eval sudo $history[1]
end

# Like 'cat', but with pretty colors
alias c="pygmentize -O style=monokai -f console256 -g"

# https://github.com/pyenv/pyenv#homebrew-in-macos
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

# If battery runs out, Postgres will likely not shut down correctly
# This might lead to a state where the process needs to be killed
# Run the command below, and then "kill -9 PID"
# https://stackoverflow.com/questions/37307346/is-the-server-running-on-host-localhost-1-and-accepting-tcp-ip-connections
alias postgresport='postgres -D /usr/local/var/postgres'

# Heroku: See commit diff between staging and production
alias hdiff='heroku pipelines:diff -a '
