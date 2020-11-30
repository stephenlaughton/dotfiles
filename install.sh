#!/bin/bash

echo "installing dotfiles"

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo ""
    echo "Install Base16? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "Installing Base16 colourfullness"
        git clone https://github.com/stephenlaughton/base16-shell.git ~/.config/base16-shell
    fi

    echo ""
    echo "Install homebrew? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "installing homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "brewing all the things"
        source install/brew.sh
    fi

    echo ""
    echo "Install zinit? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "installing zinit for fancy zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    fi

    echo ""
    echo "Install fisher? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "installing fisher for fancy fish"
        curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    fi

    echo ""
    echo "Link dotfiles to ~ directory? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "Linking!"
        source install/link.sh
    fi

    echo ""
    echo "Souppedup OSX? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        echo "updating OSX settings"
        source installosx.sh
    fi
fi