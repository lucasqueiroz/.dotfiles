#!/bin/sh

sudo apt update

# ZSH
sudo apt install zsh

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Homeshick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

homeshick clone lucasqueiroz/.dotfiles

# Setup Nix
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs

nix-channel --update

# FZF
nix-env -iA nixpkgs.fzf

# EZA
nix-env -iA nixpkgs.eza

# Glow
nix-env -iA nixpkgs.glow

# Bottom
nix-env -iA nixpkgs.bottom

# Zoxide
nix-env -iA nixpkgs.zoxide

# Bat
nix-env -iA nixpkgs.bat

# Wezterm
nix-env -iA nixpkgs.wezterm

# Thunderbird
nix-env -iA nixpkgs.thunderbird

# Obsidian
nix-env -iA nixpkgs.obsidian

# VS Code
nix-env -iA nixpkgs.vscode

# Uv
nix-env -iA nixpkgs.uv

# Podman
nix-env -iA nixpkgs.podman

# Lazygit
nix-env -iA nixpkgs.lazygit

# Lazydocker
nix-env -iA nixpkgs.lazydocker

# Solaar
nix-env -iA nixpkgs.solaar

# NordVPN
echo "Install NordVPN, until they have a better installation method..."