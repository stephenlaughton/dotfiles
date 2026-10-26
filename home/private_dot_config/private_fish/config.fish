# Homebrew (Apple Silicon)
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# Editor. laptop.fish switches these to VS Code.
set -gx EDITOR vim
set -gx VISUAL vim

# User-installed binaries. fish_add_path skips directories that don't exist.
fish_add_path -g $HOME/.local/bin $HOME/.cargo/bin $HOME/.bun/bin
set -gx GOPATH $HOME/go
fish_add_path -ga $GOPATH/bin

# Laptop-only setup (Android, editors, local AI). chezmoi installs it on the laptop only.
test -f ~/.config/fish/laptop.fish; and source ~/.config/fish/laptop.fish

# Base16 Shell
if status is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    if test -f "$BASE16_SHELL/profile_helper.fish"
        source "$BASE16_SHELL/profile_helper.fish"
    end
end

# Alias eza
alias ll='eza -bghHliSa --git'

# Alias npm list to see all global
abbr -a npmlist 'npm list -g --depth 0'

# e convenience function
function e -d "code <args> or code ."
    if count $argv > /dev/null
        code $argv
    else
        code .
    end
end

# Alias gcam because it nice
abbr -a gcam 'git add . && git commit -am'

# g convenience function
function g -d "git <args> or git status"
    if count $argv > /dev/null
        git $argv
    else
        git status
    end
end

# Reload command
abbr -a -g r! source ~/.config/fish/config.fish

# mise (versions for node, python, etc.)
if type -q mise
    mise activate fish | source
end

# direnv: per-directory env (e.g. life repo picks the personal Claude account)
if status is-interactive; and type -q direnv
    direnv hook fish | source
end
# Billie Claude account (Max), even inside folders where direnv selects the personal one
alias claude-billie 'env -u CLAUDE_CONFIG_DIR claude'
