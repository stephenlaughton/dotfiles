#!/bin/sh
# Install Proto and configure tools

echo "Installing Proto..."

# Install Proto if not already installed
if ! command -v proto &> /dev/null; then
    echo "Installing Proto via installer script..."
    curl -fsSL https://moonrepo.dev/install/proto.sh | bash

    # Add proto to current shell session
    export PROTO_HOME="$HOME/.proto"
    export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"
else
    echo "Proto already installed"
fi

# Install all tools defined in .prototools
echo "Installing tools via Proto..."
proto install

# Install global npm packages if needed
echo "Setting up global npm packages directory..."
proto install node npm

echo "Proto setup complete!"
echo "Tools installed:"
proto list