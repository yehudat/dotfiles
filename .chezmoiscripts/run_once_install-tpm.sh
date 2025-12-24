#!/bin/bash
# Install TPM (Tmux Plugin Manager) if not present

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM installed. Run: ~/.tmux/plugins/tpm/bin/install_plugins"
else
    echo "TPM already installed."
fi
