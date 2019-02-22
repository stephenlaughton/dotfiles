#!/bin/sh
# give me what I need, brew!

# development tools
brew install git
brew install vim --with-lua
brew install zsh
# zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# get cask versions also
brew tap caskroom/versions

# apps
brew cask install alfred
brew cask install appcleaner
brew cask install carbon-copy-cloner
brew cask install daisydisk
brew cask install dropbox
brew cask install google-chrome
brew cask install hammerspoon
brew cask install istat-menus
brew cask install iterm2
brew cask install skype
brew cask install transmission
brew cask install vlc

echo ""
echo "Install Extra Dev Stuff? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]; then
    # cli tools
    brew install ack
    brew install tree
    brew install wget

    # development server setup
    brew install nginx

    # development tools
    brew install hub
    brew install reattach-to-user-namespace
    brew install highlight
    brew install svn

    # Node stuff
    brew install nodenv
    # grab stable version of node
    nodenv install 8.11.4
    # convenience plugin for nodenv
    git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)"/plugins/nodenv-package-rehash
    nodenv package-hooks install --all
    brew install yarn --ignore-dependencies

    brew install ruby
    brew install m-cli
    brew install git-flow
    brew install grep
    brew install watchman
    brew install exa
    brew install fish

    # dev casks
    brew cask install dash
    brew cask install duet
    brew cask install firefox
    brew cask install visual-studio-code-insiders
    brew cask install slack
    brew cask install docker
fi
