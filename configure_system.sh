#!/bin/bash

# setup specific filetypes (either dot files in home dir or directorys under ~/.config/
dotfiles=("vim/vimrc" "bash/inputrc" "bash/bashrc" "bash/bash_aliases" "screen/screenrc")

configdirs=("dunst" "mpv" "i3" "i3status" "terminator")

function add_dotfile {
	file=$1
	echo linking $file  to  ~/.${file#*/}
	ln -f $file ~/.${file#*/}
}

function add_configdir {
	dir=$1
	echo linking $dir/* to ~/.config/$dir
    
	for f in $dir/*
	do
		ln -f $f ~/.config/$f
	done
}
echo "Use this script to link config files found here to your home directory ($HOME)"

echo "Install config files for all?"

for str in ${dotfiles[@]};
do
	echo $str
done

for str in ${configdirs[@]};
do
	echo $str
done

echo "Install all these configurations?? (y/n)"
read all

if [ $all = y ]
then
    for str in ${dotfiles[@]};
    do
		add_dotfile $str
    done

    for str in ${configdirs[@]};
    do
		add_configdir $str
    done
elif [ $all = n ]
then
    echo 'Add configurations one at a time'
    for str in ${dotfiles[@]};
    do
        echo "add $str? (y/n)"
		read add
		if [ $add = "y" ]
        then
		add_dotfile $str
		fi
    done

    for str in ${configdirs[@]};
    do
        echo "add $str? (y/n)"
		read add
		if [ $add = "y" ]
        then
		add_configdir $str
		fi
    done
    
else
    echo "enter eithery 'y' or 'n'"
fi

