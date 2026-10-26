#!/bin/bash
# Installs Homebrew on a fresh Mac. Runs once per machine, before any files are written.
set -euo pipefail
[[ "$(uname)" == Darwin ]] || exit 0
[[ -x /opt/homebrew/bin/brew ]] && exit 0

echo "==> Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
