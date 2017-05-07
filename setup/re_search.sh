install_re_search() {
    make -C ~/.config/fisherman/re-search
    chmod +x ~/.config/fisherman/re-search/re-search
    ln -s ~/.config/fisherman/re-search/re-search /usr/local/bin/re-search
}
