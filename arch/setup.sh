#!/bin/bash
set -e

# Arch Linux Complete Setup Script
# This script installs all necessary packages and configures dotfiles

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
    echo -e "${YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] WARNING: $1${NC}"
}

error() {
    echo -e "${RED}[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: $1${NC}"
}

info() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')] INFO: $1${NC}"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   error "This script should not be run as root"
   exit 1
fi

log "Starting Arch Linux setup..."

# Update system first
log "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install essential packages for Neovim
log "Installing Neovim and dependencies..."
sudo pacman -S --needed --noconfirm \
    git \
    neovim \
    nodejs \
    npm \
    python \
    python-pip \
    make \
    gcc \
    ripgrep \
    fd \
    fzf \
    tree-sitter \
    tree-sitter-cli \
    unzip \
    curl \
    wget \
    base-devel \
    rust

# Install Hyprland and Waybar
log "Installing Hyprland and Waybar..."
sudo pacman -S --needed --noconfirm \
    hyprland \
    waybar \
    wl-clipboard \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk

# Install basic fonts for proper display
log "Installing fonts..."
sudo pacman -S --needed --noconfirm \
    ttf-fira-code \
    noto-fonts \
    noto-fonts-emoji

# Check if yay is installed, if not install it
if ! command -v yay &> /dev/null; then
    log "Installing yay AUR helper..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
else
    log "yay is already installed"
fi

# Install essential AUR packages  
log "Installing Nerd Fonts from AUR..."
yay -S --needed --noconfirm \
    nerd-fonts-fira-code

# Create necessary directories
log "Creating necessary directories..."
mkdir -p ~/.config
mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/Pictures/Screenshots

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

log "Dotfiles directory: $DOTFILES_DIR"

# Backup existing configurations
log "Backing up existing configurations..."
backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

# Backup existing configs if they exist
for config in nvim waybar hypr; do
    if [[ -d "$HOME/.config/$config" ]]; then
        warn "Backing up existing $config configuration to $backup_dir"
        cp -r "$HOME/.config/$config" "$backup_dir/"
    fi
done

if [[ -f "$HOME/.gitconfig" ]]; then
    warn "Backing up existing .gitconfig to $backup_dir"
    cp "$HOME/.gitconfig" "$backup_dir/"
fi

# Copy dotfiles configurations
log "Copying dotfiles configurations..."

# Copy Neovim config
if [[ -d "$DOTFILES_DIR/nvim" ]]; then
    log "Installing Neovim configuration..."
    rm -rf ~/.config/nvim
    cp -r "$DOTFILES_DIR/nvim" ~/.config/
    info "Neovim configuration installed"
else
    error "Neovim configuration not found in $DOTFILES_DIR/nvim"
fi

# Copy Waybar config
if [[ -d "$DOTFILES_DIR/waybar/.config/waybar" ]]; then
    log "Installing Waybar configuration..."
    rm -rf ~/.config/waybar
    cp -r "$DOTFILES_DIR/waybar/.config/waybar" ~/.config/
    info "Waybar configuration installed"
else
    error "Waybar configuration not found in $DOTFILES_DIR/waybar/.config/waybar"
fi

# Copy Hyprland config
if [[ -d "$DOTFILES_DIR/hyprland/.config/hypr" ]]; then
    log "Installing Hyprland configuration..."
    rm -rf ~/.config/hypr
    cp -r "$DOTFILES_DIR/hyprland/.config/hypr" ~/.config/
    info "Hyprland configuration installed"
else
    error "Hyprland configuration not found in $DOTFILES_DIR/hyprland/.config/hypr"
fi

# Configure Git
log "Configuring Git..."
echo
read -p "Enter your Git name (e.g., 'John Doe'): " git_name
read -p "Enter your Git email (e.g., 'john@example.com'): " git_email

if [[ -n "$git_name" && -n "$git_email" ]]; then
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    git config --global core.editor nvim
    info "Git configuration completed"
    info "Name: $git_name"
    info "Email: $git_email"
    info "Editor: nvim"
else
    warn "Git configuration skipped (empty input)"
fi

# Install Node.js packages for Neovim
log "Installing Node.js packages for Neovim..."
npm install -g neovim tree-sitter-cli

# Install Python packages for Neovim
log "Installing Python packages for Neovim..."
pip install --user pynvim

# Create a simple Hyprland start script
log "Creating Hyprland start script..."
cat > ~/.local/bin/start-hyprland << 'EOF'
#!/bin/bash
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
exec Hyprland
EOF
chmod +x ~/.local/bin/start-hyprland

log "Setup completed successfully!"
echo
info "=== NEXT STEPS ==="
info "1. Log out and back in (or reboot) to ensure all changes take effect"
info "2. Start Hyprland with: start-hyprland"
info "3. Open Neovim to let plugins install automatically: nvim"
info "4. Your old configs were backed up to: $backup_dir"
echo
