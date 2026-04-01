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

# Backup existing configurations (optional)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.config/waybar ~/.config/waybar.backup 2>/dev/null || true
mv ~/.config/hypr ~/.config/hypr.backup 2>/dev/null || true
mv ~/.tmux.conf ~/.tmux.conf.backup 2>/dev/null || true

# Create symlinks to configurations
ln -sf <base_location>/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf <base_location>/dotfiles/nvim ~/.config/nvim
ln -sf <base_location>/dotfiles/waybar/.config/waybar ~/.config/waybar
ln -sf <base_location>/dotfiles/hyprland/.config/hypr ~/.config/hypr

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.editor nvim
```

## Individual Configurations

### Tmux
```bash
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
# Reload inside tmux
tmux source-file ~/.tmux.conf
```
Top status bar with rounded pill tabs, orange active tab, and running process indicator.

#### Tmuxinator
```bash
# Copy the template and customize per project
cp ~/dotfiles/tmux/tmuxinator/project.yml ~/.config/tmuxinator/my-project.yml
# Edit PROJECT_NAME to match your project
# Start with: tmuxinator start my-project
```
Template project layout with editor, agent, server, console, and scratch windows. Replace `PROJECT_NAME` in the template with your project name.

### Neovim
```bash
# Backup existing config (optional)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
# Create symlink
ln -sf ~/dotfiles/nvim ~/.config/nvim
```
Modular plugin system with LSP, Telescope, custom keybindings, etc.

### Waybar
```bash
# Backup existing config (optional)
mv ~/.config/waybar ~/.config/waybar.backup 2>/dev/null || true
# Create symlink
ln -sf ~/dotfiles/waybar/.config/waybar ~/.config/waybar
```
Status bar for Wayland compositors.

### Hyprland
```bash
# Backup existing config (optional)
mv ~/.config/hypr ~/.config/hypr.backup 2>/dev/null || true
# Create symlink
ln -sf ~/dotfiles/hypr ~/.config/hypr
```
Tiling Wayland compositor configuration.

## Dependencies

### Arch Linux
```bash
sudo pacman -S neovim hyprland waybar git nodejs npm python
```

### Other Distributions
Install equivalent packages for your distribution.
