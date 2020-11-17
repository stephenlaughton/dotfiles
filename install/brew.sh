#!/bin/sh
# give me what I need, brew!

# get cask versions and fonts also
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# development tools
brew install git
brew install svn
# Node stuff
brew install nodenv
# grab stable version of node
nodenv install 12.16.1
# convenience plugin for nodenv
git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)"/pluginsnodenv-package-rehash
nodenv package-hooks install --all
brew install ruby
brew install m-cli
brew install grep
brew install watchman
brew install bash
brew install zsh
brew install fish
brew install exa
brew install carthage
brew install ideviceinstaller
brew install scrcpy
brew cask install adoptopenjdk8

# apps
brew cask install alfred
brew cask install android-studio
brew cask install appcleaner
brew cask install google-chrome
brew cask install hammerspoon
brew cask install istat-menus
brew cask install kap
brew cask install firefox
brew cask install visual-studio-code-insiders
brew cask install slack
brew cask install the-unarchiver
brew cask install 1password
brew cask install telegram
brew cask install figma
brew cask install notion

# fonts
brew cask install font-jetbrains-mono