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

        echo "adding homebrew to PATH"
        if [[ -f /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f /usr/local/bin/brew ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi

        if ! command -v brew &> /dev/null; then
            echo "ERROR: brew command not found even after installation"
            exit 1
        fi

        echo "brewing all the things"
        source install/brew.sh
    fi


    echo ""
    echo "Install Proto (version manager for Node, Python, etc.)? (y/n)"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
        source install/proto.sh
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

    # macOS defaults script disabled - needs audit before use
    # To manually configure macOS settings, see installosx.sh
fi