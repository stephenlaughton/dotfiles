# Laptop-only fish setup, sourced from config.fish.
# chezmoi installs this file on the "laptop" profile only.

set -gx EDITOR "code --wait"
set -gx VISUAL "code --wait"

# Homebrew Ruby (cocoapods, fastlane)
fish_add_path -g /opt/homebrew/opt/ruby/bin

# Android
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_SDK $ANDROID_HOME
fish_add_path -ga $ANDROID_HOME/tools $ANDROID_HOME/tools/bin
fish_add_path -g $ANDROID_HOME/emulator
# platform-tools goes FIRST, not last: a second adb of a different version
# anywhere on PATH makes every client kill and restart the server, and wireless
# connections (unlike USB ones) do not survive that. The Homebrew cask
# android-platform-tools was removed for the same reason. Mirrors laptop.zsh.
fish_add_path -g --move $ANDROID_HOME/platform-tools

# Reconnect the Pixel over wireless adb. Mirrors the laptop.zsh function.
#
# Tries the fixed tcpip port first (established once over USB with
# `adb tcpip 5555`), then falls back to resolving the rotating
# wireless-debugging port over Bonjour. dns-sd does that resolution rather than
# `adb mdns`, because adb's own discovery sees nothing unless the app that
# spawned it holds macOS Local Network permission — an Apple binary is exempt,
# adb is not.
function pixel --description 'Connect to the Pixel over wireless adb'
    set -l ip (test -n "$PIXEL_IP"; and echo $PIXEL_IP; or echo 192.168.50.9)
    if adb connect "$ip:5555" 2>/dev/null | string match -qr '^(connected|already connected)'
        adb devices -l
        return 0
    end
    # The instance name is the LAST field of the browse line, not the first
    # thing matching /adb-/ — that would match inside "_adb-tls-connect._tcp.".
    set -l instance (dns-sd -t 5 -B _adb-tls-connect._tcp local 2>/dev/null | awk '/ adb-/{print $NF; exit}')
    if test -z "$instance"
        echo "pixel: no wireless-debugging service on the network — is it switched on?" >&2
        return 1
    end
    set -l port (dns-sd -t 5 -L "$instance" _adb-tls-connect._tcp local 2>/dev/null | string match -r 'can be reached at \S+:(\d+)' -g | head -n1)
    if test -z "$port"
        echo "pixel: found $instance but could not resolve its port" >&2
        return 1
    end
    adb connect "$ip:$port"
    adb devices -l
end

# CLIs with their own installers
fish_add_path -ga $HOME/.lmstudio/bin $HOME/.opencode/bin $HOME/.amp/bin

# LocalAI global configuration
set -gx LOCALAI_MODELS_PATH "$HOME/LocalAI/models"
set -gx LOCALAI_BACKENDS_PATH "$HOME/LocalAI/backends"
set -gx LOCALAI_CONFIG_DIR "$HOME/LocalAI/configuration"
set -gx LOCALAI_ADDRESS "0.0.0.0:8080"
set -gx LOCALAI_F16 "true"
set -gx LOCALAI_THREADS "8"
