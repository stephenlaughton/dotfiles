#!/bin/bash
# Installs Claude Code with its native installer (it keeps itself updated).
set -euo pipefail
if command -v claude >/dev/null || [[ -x "$HOME/.local/bin/claude" ]]; then
    exit 0
fi
echo "==> Installing Claude Code"
curl -fsSL https://claude.ai/install.sh | bash
