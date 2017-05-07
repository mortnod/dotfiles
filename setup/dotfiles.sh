source 'utils.sh'

install_dotfiles() {
    relative_source_path=$1 # Example: "../dotfiles/fish"
    absolute_source_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )/$relative_source_path/" && pwd )

    destination_path=${2:-~/} # Where the symlinks should be placed. Default is ~/
    add_dot_in_front_of_filenames=${3:-true} # Example: true => ".hyper.js" false => "hyper.js"
    backup_path=~/dotfiles_old # old dotfiles backup directory

    # create dotfiles_old in homedir
    # print_info "Creating $backup_path for backup of any existing dotfiles in ~"
    mkdir -p $backup_path
    # print_success "Done!"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    # print_info "Creating symlinks to the dotfiles"
    for file in $absolute_source_path/*; do
        file_name=${file##*/} # $file = /absolute/path/to/file.txt  VS.  $file_name = file.txt

        if [ "$add_dot_in_front_of_filenames" = true ]; then
            absolute_symlink_path=$destination_path.$file_name
        else
            absolute_symlink_path=$destination_path$file_name
        fi

        # If the file already exists, move it to ~/dotfiles_old
        if [ -e $absolute_symlink_path ]; then
            print_info "Existing dotfile detected! Moving $file_name to ~/dotfiles_old"
            mv -f $absolute_symlink_path $backup_path
        fi

        ln -s $file $absolute_symlink_path
        print_success "$absolute_symlink_path → $file"

    done
    # print_success "Dotfiles successfully created!"
}
