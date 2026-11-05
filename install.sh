#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/CordySeph/nvim-config.git"
CONFIG_DIR="$HOME/.config/nvim"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}=======================================${NC}"
echo -e "${BLUE}   Neovim Setup for macOS (MacBook)   ${NC}"
echo -e "${BLUE}=======================================${NC}"

# 1. Check OS
if [[ "$(uname -s)" != "Darwin" ]]; then
    echo -e "${YELLOW}[Notice] This script is optimized for macOS, but running on $(uname -s)...${NC}"
fi

# 2. Check Xcode Command Line Tools (Required for Treesitter compilers)
if ! xcode-select -p &>/dev/null; then
    echo -e "${YELLOW}[*] Installing Xcode Command Line Tools...${NC}"
    xcode-select --install
    echo "Please finish the popup installer and press Enter to continue..."
    read -r
fi

# 3. Check & Install Homebrew
if ! command -v brew &>/dev/null; then
    echo -e "${YELLOW}[*] Homebrew not found. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configure PATH for brew
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo -e "${GREEN}[✓] Homebrew is already installed.${NC}"
fi

# 4. Install Dependencies via Homebrew
echo -e "${BLUE}[*] Installing dependencies (neovim, ripgrep, fd, make)...${NC}"
brew install neovim ripgrep fd make

# 5. Install Nerd Font (JetBrainsMono Nerd Font)
echo -e "${BLUE}[*] Installing JetBrains Mono Nerd Font for icons...${NC}"
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || true

# 6. Setup Configuration Directory
mkdir -p "$HOME/.config"

# Check if current running directory is already ~/.config/nvim (cloned manually)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

if [ "$SCRIPT_DIR" = "$CONFIG_DIR" ]; then
    echo -e "${GREEN}[✓] Script is running from inside $CONFIG_DIR.${NC}"
elif [ -d "$CONFIG_DIR" ]; then
    if [ -d "$CONFIG_DIR/.git" ]; then
        echo -e "${BLUE}[*] Existing repo found in $CONFIG_DIR, pulling latest...${NC}"
        git -C "$CONFIG_DIR" pull --ff-only || true
    else
        BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${YELLOW}[!] Existing non-git config found. Backing up to $BACKUP_DIR...${NC}"
        mv "$CONFIG_DIR" "$BACKUP_DIR"
        echo -e "${BLUE}[*] Cloning Neovim config from $REPO_URL...${NC}"
        git clone "$REPO_URL" "$CONFIG_DIR"
    fi
else
    echo -e "${BLUE}[*] Cloning Neovim config from $REPO_URL...${NC}"
    git clone "$REPO_URL" "$CONFIG_DIR"
fi

# 7. Sync plugins via lazy.nvim headlessly
echo -e "${BLUE}[*] Syncing plugins with Lazy.nvim...${NC}"
nvim --headless "+Lazy! sync" +qa || true

echo -e "\n${GREEN}=======================================${NC}"
echo -e "${GREEN}      Setup completed successfully! 🚀 ${NC}"
echo -e "${GREEN}=======================================${NC}"
echo -e "Run Neovim anytime with: ${BLUE}nvim${NC}"
echo -e "Tip: Set your terminal font to 'JetBrainsMono Nerd Font' to see icons properly."
