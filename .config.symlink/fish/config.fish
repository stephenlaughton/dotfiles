# Dotfiles for paths
set DOTFILES "$HOME/.dotfiles"

# Bootstrap fisher if not already there
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set Nodenv
status --is-interactive; and source (nodenv init - --no-rehash| psub)
set NODENV_VERSION "8.11.4"

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$DOTFILES/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Alias exa
alias ll='exa -bghHliSa --git'

abbr -e g
abbr -e gcam

# Alias gcam because it nice
alias gcam='git add . && git commit -am'

# gg convenience function
function g -d "git <args> or git status"
    if count $argv > /dev/null
        git $argv
    else
        git status
    end
end