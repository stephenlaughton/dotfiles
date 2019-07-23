# dotfiles

Dotfiles for easily setting up a new Jenkins machine with:

- homebrew
  - git
  - ruby
  - jenkins
  - openjdk flavour java 8
  - fish shell with config
  - nodenv with node `8.11.4`
  - yarn
  - carthage
  - vscode insiders
  - chrome
  - firefox
  - android studio
  - istat menu
  - realm studio
  - slack
  - alfred

# New Install

1. Install `Xcode` and open once so you can accept terms of service
2. Run `xcode-select --install` to get extra commandline tools
3. In terminal
   ```
   mkdir -p Dev/github.com/invoice-simple &&
   cd Dev/github.com/invoice-simple &&
   git clone https://github.com/invoice-simple/dotfiles.git &&
   cd dotfiles &&
   ./install.sh
   ```
4. Wait for a bit and make sure everything installs without errors
5. Set login shell to `zsh`
6. Set iTerm default shell to `fish`
7. Run `nodenv init` in `bash`
8. Run `nodenv global 8.11.4 && nodenv rehash`
9. `npm install -g replace ios-deploy appium`
10. `sudo gem install xcodeproj cocoapods`
11. [Set team for global installed](https://appium.readthedocs.io/en/latest/en/drivers/ios-xcuitest-real-devices/) `WebDriverAgent` (script only changes locally installed)
12. Add certs for your apple id in xcode TODO: more detail
13. Link `nodenv` node to location where `/bin/sh` can pick it up `ln -s $(which node) /usr/local/bin/node`
14. Build `ios` app at least once and grant codesigning permissions `Allow Always`

# Primary Node

1. Start jenkins and ngrok TODO: explain
2. Run Jenkins a few times adding permissions every time it fails (TODO: explain and automate)
3. Profit

# Secondary Node

1. Setup SSH access from primary node

### Extra stuff to automate
