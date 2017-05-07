print_in_green() {
    printf "\e[0;32m$1\e[0m"
}

print_in_blue() {
    printf "\e[0;34m$1\e[0m"
}

print_in_purple() {
    printf "\e[0;35m$1\e[0m"
}

print_in_red() {
    printf "\e[0;31m$1\e[0m"
}

print_in_yellow() {
    printf "\e[0;33m$1\e[0m"
}

print_heading() {
    print_in_purple "\n-------------------------------------------------"
    print_in_purple "\n$1"
    print_in_purple "\n-------------------------------------------------\n"
}

print_info() {
    print_in_blue "  [ℹ] $1\n"
}

print_question() {
    print_in_yellow "  [?] $1"
}

print_success() {
    print_in_green "  [✔] $1\n"
}

print_error() {
    print_in_red "  [✖] $1 $2\n"
}

ask_question() {
    print_question "$1 [y/n] "
    read -r response </dev/tty
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else
        return 1
    fi
}
