# dotfiles

Dotfiles for easily setting up a new Dev machine with:

- homebrew
  - git
  - ruby
  - jenkins
  - openjdk flavour java 8
  - fish shell with config
  - nodenv with node `14.17.0`
  - yarn
  - carthage
  - vscode insiders
  - chrome
  - firefox
  - android studio
  - istat menu
  - slack
  - alfred
  - linear

# New Install

1. Install `Xcode` and open once so you can accept terms of service
2. Run:
   ```
   xcode-select --install
   ```
   to get extra commandline tools
3. In terminal, run:
   ```
   mkdir -p Dev/github.com/stephenlaughton &&
   cd Dev/github.com/stephenlaughton &&
   git clone https://github.com/stephenlaughton/dotfiles.git &&
   cd dotfiles &&
   ./install.sh
   ```
4. Wait for a bit and make sure everything installs without errors
5. Set login shell to `zsh`
6. Set iTerm default shell to `fish`
7. Run `nodenv init` in `bash`
8. Run `nodenv global 14 && nodenv rehash`
9. `npm install -g expo-cli eas-cli yarn`
10. `sudo gem install xcodeproj cocoapods`
11. Link `nodenv` node to location where `/bin/sh` can pick it up `ln -s $(which node) /usr/local/bin/node`
