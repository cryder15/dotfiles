#!/bin/bash

# Quick install script for Arch Linux dotfiles setup
# Usage: curl -sSL https://raw.githubusercontent.com/cryder15/dotfiles/main/arch/install.sh | bash

set -e

echo "Starting Arch Linux dotfiles quick install..."

# Check if we're already in the dotfiles repo
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ "$(basename "$(dirname "$SCRIPT_DIR")")" == "dotfiles" ]]; then
    echo "Running from existing dotfiles repository..."
    # We're already in the repo, just run setup
    chmod +x setup.sh
    echo "Running complete setup..."
    ./setup.sh
else
    echo "Running remote install, cloning repository..."
    
    # Check if git is installed
    if ! command -v git &> /dev/null; then
        echo "Installing git..."
        sudo pacman -S --noconfirm git
    fi

# Remove existing dotfiles if present
if [[ -d "$HOME/dotfiles" ]]; then
    echo "Removing existing dotfiles directory..."
    rm -rf "$HOME/dotfiles"
fi

    # Clone the repository
    echo "Cloning dotfiles repository..."
    git clone https://github.com/cryder15/dotfiles.git "$HOME/dotfiles"

    # Change to arch directory
    cd "$HOME/dotfiles/arch"

    # Make setup script executable
    chmod +x setup.sh

    # Run the setup script
    echo "Running complete setup..."
    ./setup.sh
fi

echo "Quick install completed" 