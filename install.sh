#!/bin/bash

echo "installing dotfiles"

echo "initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "brewing all the things"
    source install/brew.sh

    echo "updating OSX settings"
    source installosx.sh
fi


# echo "configuring zsh as default shell"
sudo -s
echo $(which zsh) >> /etc/shells
chsh -s $(which zsh)
