#!/bin/bash
# This script creates symbolic links for the specified files in the current directory.

CURRENT_DIR=$(pwd)

# asdf
echo "Creating symlinks for asdf..."

if command -v asdf >/dev/null 2>&1; then
    asdf --version

    ln -svw "$CURRENT_DIR/asdf/.asdfrc"         "$HOME/.asdfrc"
    ln -svw "$CURRENT_DIR/asdf/.tool-versions"  "$HOME/.tool-versions"
else
    echo "asdf is not installed."
fi
echo ""

# git
echo "Creating symlinks for git..."

if command -v git >/dev/null 2>&1; then
    git --version

    ln -svw "$CURRENT_DIR/git/.gitconfig" "$HOME/.gitconfig"
else
    echo "git is not installed."
fi
echo ""

# k9s
echo "Creating symlinks for k9s..."

if command -v k9s >/dev/null 2>&1; then
    k9s version -s

    # Create the directory if it doesn't exist
    mkdir -p "$HOME/Library/Application Support/k9s"
    ln -svw "$CURRENT_DIR/k9s/config.yaml" "$HOME/Library/Application Support/k9s/config.yaml"
else
    echo "k9s is not installed."
fi
echo ""

# zsh
echo "Creating symlinks for zsh..."

if command -v zsh >/dev/null 2>&1; then
    zsh --version

    ln -svw "$CURRENT_DIR/zsh/.zshrc" "$HOME/.zshrc"
else
    echo "zsh is not installed."
fi
echo ""
