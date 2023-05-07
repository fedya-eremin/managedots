#!/bin/bash


case "$1" in
    -i|--install) 
        [[ -e $HOME/$2 ]] || { echo "No such directory" ; exit 1; }
        [[ -d $HOME/$2 ]] || { echo "Source is not a directory" ; exit 1; }
        [[ -z $2 ]] && { echo "No source specified"; exit 1; }
        [[ -z $3 ]] && echo "No config directory specified, defaults to ~/.config"
        config=${3:-".config"}
        for file in $(ls $HOME/$2); do
            state="n"
            if ! grep -Fxq "$file" "$HOME/$2/.dotsignore" && [[ -L $HOME/$config/$file ]]; then
                read -p "$file exists. Overwrite? y/N: " $state
            fi
            [[ ! -L $HOME/$config/$file ]] && state="y"
            if [[ $state == "y" ]]; then
                [[ -e $HOME/$config/$file ]] && rm -rf $HOME/$config/$file
                ln -s $HOME/$2/$file $HOME/$config/$file
            fi
        done
    ;;
    -s|--strap)
        [[ -z $2 ]] && { echo "No github repository specified"; exit 1; }
        [[ -z $3 ]] && { echo "No directory name specified"; exit 1; }
        [[ ! -e $HOME/.local ]] && mkdir "$HOME/.local"
        if [[ $2 =~ https://[a-zA-Z0-9$-_.+]+ ]]; then  # a pretty weak url check
            git clone "$2" "$HOME/.local/$3"
        else 
            git clone "https://github.com/$2" "$HOME/.local/$3"
        fi
        [[ $? -eq 0 ]] && echo "Now perform managedots -i for ~/.local/$3"
    ;;
    -h|--help)
        echo "managedots - an utility to make symlinks to your configurations, e.g. in ~/.config/
        commands:
        -i, --install <source> <destination (default value is ~/.config)> - basically creates symlinks for
            files from source to destination. ignores files in .dotsignore.
            to override file or not type y or n. all paths are relative to your \$HOME;
        -s, --strap <github-repo-name> or <url> <name-you-like> - downloads to your ~/.local/ directory
            your preferred repository
        -h, --help - prints this message"
    ;;
    *) 
        echo "Unknown flag"
        exit 1
    ;;
esac
