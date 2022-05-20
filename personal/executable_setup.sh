#1/bin/sh

# App links
# https://github.com/sindresorhus/pure
# https://github.com/zplug/zplug
# https://www.chezmoi.io/
# https://github.com/tmux-plugins/tpm
# https://github.com/junegunn/fzf

# This script is used to setup ervin's env
# Assumes you have tmux, zsh, neovim and fzf installed

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh

# Install zsh auto completion
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh


# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)"

# Install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install dotfiles
chezmoi init --apply https://github.com/ervincanigur/dotfiles.git

echo "Done"
