#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "----------- we are in $DIR"

OLDDOTFILES=$HOME/.old_dotfiles

# create dotfiles_old in homedir
echo "creating $OLDDOTFILES for backup of any existing dotfiles in $HOME"
mkdir -p $OLDDOTFILES
echo "...done"

# move any existing dotfiles into .old_dotfiles and then link
echo "moving any old dotfiles into .old_dotfiles and creating symlinks"
linkables=$( ls -1 -d **/*.symlink )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    echo "Moving any existing dotfiles from ~ to $OLDDOTFILES"
    mv $target $OLDDOTFILES
    echo "creating symlink for $file"
    ln -s $DIR/$file $target
done