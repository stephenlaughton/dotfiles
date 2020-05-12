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
pwd
linkables=$( find . -name "*.symlink" )
echo $linkables
for file in $linkables ; do
    prefix="./"
    newFile=${file#"$prefix"}
    target="$HOME/.$( basename $file ".symlink" )"
    echo "Moving any existing dotfiles from ~ to $OLDDOTFILES"
    # allow folder-folder-whatever.symlink to be folder/folder/whatever
    newTarget=${target//-/\/}
    mv $target $OLDDOTFILES
    echo "creating symlink for $newFile -> $target -> $newTarget"
    ln -fhs $PARENTDIR/$newFile $newTarget
done

# link dotfiles dir to ~/.dotfiles/
echo "linking this directory to $HOME/.dotfiles"
ln -fhs $PARENTDIR $HOME/.dotfiles
