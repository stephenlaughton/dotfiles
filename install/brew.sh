#!/bin/sh
# give me what I need, brew!

# development tools
brew install git
brew install vim --with-lua
brew install zsh

# get cask versions also
brew tap caskroom/versions

# apps
brew cask install 1password
brew cask install appcleaner
brew cask install carbon-copy-cloner
brew cask install daisydisk
brew cask install dropbox
brew cask install google-chrome
brew cask install handbrake
brew cask install istat-menus
brew cask install iterm2
brew cask install selfcontrol
brew cask install skype
brew cask install spectacle
brew cask install transmission
brew cask install vlc
brew cask install hammerspoon
brew cask install alfred
brew cask install logitech-options

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
    brew install tmux
    brew install highlight
    brew install nvm
    brew install chruby
    brew install ruby-install
    brew install m-cli

    # dev casks
    brew cask install dash
    brew cask install duet
    brew cask install firefox
    brew cask install visual-studio-code-insiders
fi
