#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if ! command -v stow &> /dev/null; then
    echo "stow is not installed. Please install stow first."
    exit 1
else
    echo "stow is installed. Proceeding..."
fi

PARENT_DIR="$(dirname "$SCRIPT_DIR")"
DOTFILES_DIR="$PARENT_DIR/dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    echo "Navigating to the $DOTFILES_DIR directory..."
    cd "$DOTFILES_DIR" || { echo "Failed to navigate to $DOTFILES_DIR directory."; exit 1; }
else
    echo "The $DOTFILES_DIR directory does not exist."
    exit 1
fi

echo "Executing stow in verbose mode, targeting the home directory (~)..."
stow -v -t ~ .

# Check if stow executed successfully
if [ $? -eq 0 ]; then
    echo "stow executed successfully."
else
    echo "stow encountered an error."
    exit 1
fi
