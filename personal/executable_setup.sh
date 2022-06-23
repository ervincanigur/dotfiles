#!/bin/sh -ex

# App links
# https://github.com/sindresorhus/pure
# https://github.com/zplug/zplug
# https://www.chezmoi.io/
# https://github.com/tmux-plugins/tpm
# https://github.com/junegunn/fzf
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

# This script is used to setup ervin's env
# Assumes you have tmux, zsh and neovim installed

# Check if ubuntu/debian based
if [ -f /etc/debian_version ]; then
    # Install dependencies
    sudo apt-get update
    sudo apt-get install -y \
        zsh \
        tmux \
        neovim

# Install pyenv
curl https://pyenv.run | bash

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh

# ZSH Auto suggessions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# Install chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)"

# Install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install dotfiles
~/bin/chezmoi init --apply https://github.com/ervincanigur/dotfiles.git

chsh -s $(which zsh)

~/.fzf/install

echo "Done"
