#!/bin/bash

# setup specific filetypes (either dot files in home dir or directorys under ~/.config/
dotfiles=("vim/vimrc" "bash/inputrc" "bash/bashrc" "bash/bash_profile" "bash/bash_aliases" "screen/screenrc")

configdirs=("mpv" "sway" "i3status" "foot" "mako")

electron_flags=("spotify-flags.conf" "code-flags.conf")

function add_dotfile {
	file=$1
	echo linking $file  to  ~/.${file#*/}
	ln -f $file ~/.${file#*/}
}

function add_ele_flags {
	file=$1
	echo linking $file  to  ~/.config/${file}
	ln -f electron_flags/$file ~/.config/${file}
}

function add_configdir {
	dir=$1
	echo linking $dir/* to ~/.config/$dir
    
	for f in $dir/*
	do
		mkdir -p ~/.config/$dir
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

for str in ${electron_flags[@]};
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

	for str in ${electron_flags[@]};
	do
		add_ele_flags $str
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

 	for str in ${electron_flags[@]};
	do
        echo "add $str? (y/n)"
		read add
		if [ $add = "y" ]
        then
			add_ele_flags $str
		fi
	done

else
    echo "enter eithery 'y' or 'n'"
fi

