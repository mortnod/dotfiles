# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# git shortcuts
alias master="git checkout master"
alias push="git push"

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
