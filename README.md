# Personal Dotfiles

Configuration files for dev environment

## Quick Setup

### Arch Linux
```bash
curl -sSL https://raw.githubusercontent.com/cryder15/dotfiles/main/arch/install.sh | bash
```

### Manual Setup
```bash
git clone git@github.com:cryder15/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Copy configurations
cp -r nvim ~/.config/
cp -r waybar/.config/waybar ~/.config/
cp -r hyprland/.config/hypr ~/.config/

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.editor nvim
```

## Individual Configurations

### Neovim
```bash
cp -r nvim ~/.config/
```
Modular plugin system with LSP, Telescope, custom keybindings, etc.

### Waybar
```bash
cp -r waybar/.config/waybar ~/.config/
```
Status bar for Wayland compositors.

### Hyprland
```bash
cp -r hyprland/.config/hypr ~/.config/
```
Tiling Wayland compositor configuration.

## Dependencies

### Arch Linux
```bash
sudo pacman -S neovim hyprland waybar git nodejs npm python
```

### Other Distributions
Install equivalent packages for your distribution.
