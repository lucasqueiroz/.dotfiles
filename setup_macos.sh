#!/bin/sh

# Install xcode
xcode-select --install

# Install GPG
brew install gnupg
brew install pinentry-mac
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent

# Setup SSH
ssh-keygen -t ed25519 -C "me@lucasqueiroz.dev"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
echo "Paste the SSH key in GitHub"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/lucasqueiroz/.zprofile\
    eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup Git
brew install git
git config --global gpg.program "$(which gpg)"
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global user.name "Lucas Queiroz"
git config --global user.email "me@lucasqueiroz.dev"

# Install WezTerm
brew install --cask wezterm

# Install ZSH
brew install zsh
chsh -s $(which zsh)

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install ZSH-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Oh-my-posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# Install FZF
brew install fzf

# Install zoxide
brew install zoxide

# Install neovim
brew install neovim

# Install lazygit
brew install lazygit

# Install pipx
brew install pipx

# Install ranger-fm
pipx install ranger-fm

# Install posting
pipx install posting

# Install stow
brew install stow

# Install tmux
brew install tmux

# Install VSCode
brew install --cask visual-studio-code

# Make projects folder
mkdir ~/Documents/projects

# Clone .dotfiles
git clone git@github.com:lucasqueiroz/.dotfiles.git
