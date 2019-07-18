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
3. Start jenkins and ngrok TODO: explain
4. Run Jenkins a few times adding permissions every time it fails (TODO: explain and automate)
5. Profit

### Extra stuff to automate
- `npm install -g replace`
- `sudo gem install xcodeproj`
- `sudo gem install cocoapods`