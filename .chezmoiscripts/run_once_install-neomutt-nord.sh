#!/bin/bash
# Download Nord theme for neomutt

THEME_DIR="$HOME/.config/neomutt/themes"
THEME_URL="https://raw.githubusercontent.com/marcothms/mutt-nord/master/nord.theme"
THEME_FILE="$THEME_DIR/nord.muttrc"

mkdir -p "$THEME_DIR"

if [ ! -f "$THEME_FILE" ]; then
    echo "Downloading Nord theme for neomutt..."
    curl -sL "$THEME_URL" -o "$THEME_FILE"
    echo "Nord theme installed at $THEME_FILE"
else
    echo "Nord theme already installed."
fi
