# Dotfiles for paths
set DOTFILES "$HOME/.dotfiles"

# Bootstrap fisher if not already there
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set Nodenv
if status --is-interactive
    source (nodenv init - --no-rehash| psub)
    set NODENV_VERSION 8.11.4
end

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Android crap
set -x ANDROID_SDK "$HOME/Library/Android/sdk"
set -x PATH "$ANDROID_SDK/emulator $ANDROID_SDK/tools" $PATH
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x PATH $PATH "$ANDROID_HOME/tools"
set -x PATH $PATH "$ANDROID_HOME/tools/bin"
set -x PATH $PATH "$ANDROID_HOME/platform-tools"

# Set Stupid Java
set -x JAVA_HOME (/usr/libexec/java_home)
set -x PATH "$JAVA_HOME/bin" $PATH

# Alias exa
alias ll='exa -bghHliSa --git'

# Alias gcam because it nice
abbr -a gcam 'git add . && git commit -am'

abbr -e g
# g convenience function
function g -d "git <args> or git status"
    if count $argv > /dev/null
        git $argv
    else
        git status
    end
end

# e convenience function
function e -d "code <args> or code ."
    if count $argv > /dev/null
        code $argv
    else
        code .
    end
end

# Reload command
abbr -a -g r! source ~/.config/fish/config.fish