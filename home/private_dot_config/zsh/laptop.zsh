# Laptop-only zsh setup, sourced from ~/.zshrc.
# chezmoi installs this file on the "laptop" profile only.

export EDITOR="code --wait"
export VISUAL="code --wait"

# Homebrew Ruby (cocoapods, fastlane)
path=(/opt/homebrew/opt/ruby/bin $path)

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK=$ANDROID_HOME
path=($ANDROID_HOME/emulator $path $ANDROID_HOME/tools $ANDROID_HOME/tools/bin)
# platform-tools goes FIRST, not last: a second adb of a different version
# anywhere on PATH makes every client kill and restart the server, and wireless
# connections (unlike USB ones) do not survive that. The Homebrew cask
# android-platform-tools was removed for the same reason.
path=($ANDROID_HOME/platform-tools $path)

# Reconnect the Pixel over wireless adb.
#
# Tries the fixed tcpip port first (established once over USB with
# `adb tcpip 5555`), then falls back to resolving the rotating
# wireless-debugging port over Bonjour. dns-sd does that resolution rather than
# `adb mdns`, because adb's own discovery sees nothing unless the app that
# spawned it holds macOS Local Network permission — an Apple binary is exempt,
# adb is not.
pixel() {
  local ip=${PIXEL_IP:-192.168.50.9}
  if adb connect "$ip:5555" 2>/dev/null | grep -qE "^(connected|already connected)"; then
    adb devices -l
    return 0
  fi
  local instance port
  # The instance name is the LAST field of the browse line. The leading space in
  # / adb-/ matters: without it this matches inside "_adb-tls-connect._tcp".
  instance=$(dns-sd -t 5 -B _adb-tls-connect._tcp local 2>/dev/null | awk '/ adb-/{print $NF; exit}')
  if [[ -z $instance ]]; then
    echo "pixel: no wireless-debugging service on the network — is it switched on?" >&2
    return 1
  fi
  port=$(dns-sd -t 5 -L "$instance" _adb-tls-connect._tcp local 2>/dev/null |
    awk '/can be reached/{n=split($0,a,":"); split(a[n],b," "); print b[1]; exit}')
  if [[ -z $port ]]; then
    echo "pixel: found $instance but could not resolve its port" >&2
    return 1
  fi
  adb connect "$ip:$port"
  adb devices -l
}

# CLIs with their own installers
path+=($HOME/.lmstudio/bin $HOME/.opencode/bin $HOME/.amp/bin)

# LocalAI global configuration
export LOCALAI_MODELS_PATH="$HOME/LocalAI/models"
export LOCALAI_BACKENDS_PATH="$HOME/LocalAI/backends"
export LOCALAI_CONFIG_DIR="$HOME/LocalAI/configuration"
export LOCALAI_ADDRESS="0.0.0.0:8080"
export LOCALAI_F16="true"
export LOCALAI_THREADS="8"
