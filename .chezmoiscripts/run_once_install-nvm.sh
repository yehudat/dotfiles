#!/bin/bash
# Install NVM (Node Version Manager) if not present

NVM_DIR="$HOME/.nvm"

if [ ! -d "$NVM_DIR" ]; then
    echo "Installing NVM (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    echo "NVM installed. Restart shell and run: nvm install --lts"
else
    echo "NVM already installed."
fi
