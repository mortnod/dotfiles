function ls --description 'List contents of directory (with directories grouped first)'
        set -l param --color=auto
        if isatty 1
            set param $param --indicator-style=classify
        end
        command ls --group-directories-first $param $argv # This is the only line that's changed! Default is "command ls $param $argv"
end
