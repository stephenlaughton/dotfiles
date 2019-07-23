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

1. In terminal
   ```
   mkdir -p Dev/github.com/invoice-simple &&
   cd Dev/github.com/invoice-simple &&
   git clone https://github.com/invoice-simple/dotfiles.git &&
   cd dotfiles &&
   ./install.sh
   ```
2. Wait for a bit and make sure everything installs without errors
3. Set login shell to `zsh`
4. Set iTerm default shell to `fish`
5. Run `nodenv init` in `bash`
6. [Set team for global installed](https://appium.readthedocs.io/en/latest/en/drivers/ios-xcuitest-real-devices/) `WebDriverAgent` (script only changes locally installed)

# Primary Node

1. Start jenkins and ngrok TODO: explain
2. Run Jenkins a few times adding permissions every time it fails (TODO: explain and automate)
3. Profit

### Extra stuff to automate

- `npm install -g replace`
- `npm install -g ios-deploy`
- `sudo gem install xcodeproj`
- `sudo gem install cocoapods`
- add certs for your apple id in xcode
