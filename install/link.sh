#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PARENTDIR=$( dirname "$DIR" )
echo "----------- we are in $DIR"
echo "----------- parent is $PARENTDIR"

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
    ln -s $PARENTDIR/$file $target
done

# create symlinks for prezto files
echo "create symlinks for prezto files"
preztolinkables=$( ls -1 -d **/runcoms/z* )
for file in $preztolinkables ; do
    target="$HOME/.$( basename $file )"
    echo "Moving any existing dotfiles from ~ to $OLDDOTFILES"
    mv $target $OLDDOTFILES
    echo "creating symlink for $file"
    ln -s $PARENTDIR/$file $target
done

# link dotfiles dir to ~/.dotfiles/
echo "linking this directory to $HOME/.dotfiles"
ln -s $PARENTDIR $HOME/.dotfiles