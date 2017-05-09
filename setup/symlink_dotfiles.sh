#!/bin/bash

source 'utils.sh'

# Instead of actually copying the dotfiles in this repo to ~/, it simply symlinks them
# $1: Relative path to the dotfiles you want to symlink
# (optional) $2: Path to where the symlink will be placed (default is ~/)
# (optional) $3: Whether the files should be hidden or not. true == hidden, false == visible
symlink_dotfiles() {
    relative_source_path=$1 # Example: "../dotfiles/fish"
    absolute_source_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )/$relative_source_path/" && pwd )

    # Where the symlinks should be placed. Default is ~/
    destination_path=${2:-~/}

    # Whether to hide the symlinks or not (default is hidden)
    # Example: true => ".hyper.js" false => "hyper.js"
    add_dot_in_front_of_filenames=${3:-true}

    # Where existing locations should be backed up
    backup_path=~/dotfiles_old
    mkdir -p $backup_path

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
        print_success "$(tildify $absolute_symlink_path) → $(tildify $file)"

    done
}

symlink_dotfiles $1 $2 $3
