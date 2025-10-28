# Stephen's Dotfiles

Modern macOS development environment with Fish shell as primary, automated setup for web, mobile, and AI/ML development.

## Quick Start

```bash
# Prerequisites: Install Xcode and accept terms
xcode-select --install

# Clone and install
mkdir -p ~/Dev/github.com/stephenlaughton
cd ~/Dev/github.com/stephenlaughton
git clone https://github.com/stephenlaughton/dotfiles.git
cd dotfiles
./install.sh
```

## What Gets Installed

### Shell Environment
- **Primary Shell**: Fish with Fisher package manager
- **Backup Shell**: Zsh configuration
- **Theme**: Base16 shell color schemes

### Development Tools (via Homebrew)
- **Version Management**: [Proto](https://moonrepo.dev/proto) for Node.js, Go, Rust, and other tools (installed separately)
- **Languages**: Ruby (via Homebrew)
- **Package Managers**: Bun (via Proto), npm/yarn (via Proto)
- **Mobile**: Android SDK, scrcpy, watchman, ideviceinstaller
- **Modern CLI Tools**:
  - eza (better ls), bat (better cat), ripgrep (better grep)
  - fd (better find), jq (JSON processor), gh (GitHub CLI)
  - m-cli (macOS utility)
- **AI/ML**: LocalAI configuration, LM Studio, OpenCode

### Applications (via Homebrew Cask)
- **Terminal**: Ghostty (GPU-accelerated terminal)
- **Development**: Visual Studio Code, Android Studio, Linear, Insomnia
- **Productivity**: Raycast (Alfred/Spotlight replacement + window management), Notion
- **Browsers**: Google Chrome, Firefox, Responsively
- **Design**: Figma
- **Utilities**:
  - 1Password, AppCleaner, DaisyDisk, The Unarchiver
  - Hammerspoon (vim-style navigation), Stats (system monitor)
- **Communication**: Slack
- **Media**: VLC, Kap (screen recording), BlackHole (audio routing)
- **Fonts**: JetBrains Mono Nerd Font

## Fish Shell Configuration

Fish is the primary shell with these features:

### Auto-bootstrapping
- Fisher package manager installs automatically on first run
- Base16 shell theming (if installed)

### Key Functions & Abbreviations
- `g` - Git status or pass-through to git
- `e` - Opens VS Code (current dir or specified files)
- `gcam` - Git add all and commit
- `ll` - Enhanced ls with git info (via eza)
- `r!` - Reload Fish configuration
- `npmlist` - Show global npm packages

### Environment Setup
- Proto for Node.js management with global modules support
- Android SDK paths (emulator, platform-tools)
- Go workspace ($GOPATH)
- Rust/Cargo binaries
- Bun, Moon tooling
- LocalAI configuration
- LM Studio CLI

## Git Configuration

Extensive git aliases and settings:
- **Security**: Uses macOS keychain for credentials
- **Editor**: VS Code as default editor
- **Aliases**:
  - `git lg` - Pretty log graph
  - `git cleanup` - Prune and clean repository
  - `git undo` - Soft reset last commit
  - Many more (see `git la` for full list)

## Installation Options

The installer (`install.sh`) will prompt for:
1. Base16 shell colors installation
2. Homebrew and all packages
3. Fisher for Fish (auto-installs)
4. Dotfile symlinking

**Note**: macOS defaults script (`installosx.sh`) is currently disabled and needs audit before use.

## Post-Installation

1. Set Fish as default shell:
   ```bash
   echo /usr/local/bin/fish | sudo tee -a /etc/shells
   chsh -s /usr/local/bin/fish
   ```

2. Configure git identity:
   ```fish
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

3. Set up SSH keys for GitHub

4. Install any additional Fisher plugins as needed

## Directory Structure

```
dotfiles/
├── fish/                 # Fish shell config
├── zsh/                  # Zsh config (backup)
├── git/                  # Git configuration
├── hammerspoon/          # Vim-style navigation keys (Ctrl+hjkl)
├── install/              # Installation scripts
│   ├── brew.sh          # Homebrew packages
│   └── link.sh          # Symlink creator
├── iterm/               # iTerm2 settings
├── Stats.plist          # Stats app configuration
├── iStat Menus Settings.ismp  # Legacy iStat config
└── installosx.sh        # macOS defaults (deprecated)
```

## Updating

```bash
cd ~/.dotfiles
git pull
./install.sh  # Re-run relevant sections
fisher update # Update Fish plugins
```

## Future Improvements

- [ ] Migrate to chezmoi or yadm for better templating and secrets management
- [ ] Audit and modernize macOS defaults script
- [ ] Add automated backup of existing dotfiles
- [ ] Document Fisher plugins setup

## License

MIT