#!/bin/bash
# Install Vundle (Vim plugin manager) if not present

VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle (Vim Plugin Manager)..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
    echo "Vundle installed. Run: vim +PluginInstall +qall"
else
    echo "Vundle already installed."
fi
