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
brew install --cask adoptopenjdk8
brew install bash
brew install carthage
brew install exa
brew install fish
brew install grep
brew install ideviceinstaller
brew install m-cli
brew install ruby
brew install scrcpy
brew install watchman
brew install zsh
brew install blackhole-2ch

# apps
brew install --cask 1password
brew install --cask alfred
brew install --cask android-studio
brew install --cask appcleaner
brew install --cask daisydisk
brew install --cask discord
brew install --cask figma
brew install --cask finicky
brew install --cask firefox
brew install --cask google-chrome
brew install --cask graphiql
brew install --cask hammerspoon
brew install --cask handbrake
brew install --cask istat-menus
brew install --cask kap
brew install --cask notion
brew install --cask responsively
brew install --cask slack
brew install --cask telegram
brew install --cask the-unarchiver
brew install --cask visual-studio-code-insiders

# fonts
brew install --cask font-jetbrains-mono