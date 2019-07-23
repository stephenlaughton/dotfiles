#!/bin/bash

echo "installing dotfiles"

source install/link.sh
git clone https://github.com/stephenlaughton/base16-shell.git ~/.config/base16-shell

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo ""
    echo "Install homebrew? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "installing homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        echo "brewing all the things"
        source install/brew.sh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
    fi
    echo "updating OSX settings"
    source installosx.sh
fi


echo ""
echo "Change shell? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
    echo "configuring fish as default shell"
    sudo -s
    echo $(which fish) >> /etc/shells
    chsh -s $(which fish)
fi