#!/bin/bash
#
# Setup script for Raspberry Pi

set -euo pipefail

declare SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"
declare REPO_ROOT="${SCRIPT_DIR}"

echo "[INFO] RasPi-Starter: Install Zsh, Git, Snap with apt"
sudo apt update
sudo apt install -y zsh git snapd


### Setup Git
(source "${REPO_ROOT}/tools/git/setup.sh")


### Setup my dotfiles
echo "[INFO] RasPi-Starter: Start my dofiles setup"
declare DOTFILES_REPO_ROOT="${HOME}/dotfiles"
if [[ ! -d "${DOTFILES_REPO_ROOT}" ]]; then
  git clone git@github.com:cykps/dotfiles.git "${DOTFILES_REPO_ROOT}"
fi
"${DOTFILES_REPO_ROOT}/setup-scripts/setup.sh"
echo "[INFO] RasPi-Starter: Completed my dofiles setup"


### Install Neovim
echo "[INFO] RasPi-Starter: Start installing Neovim"
bash -c "sudo snap install --beta nvim --classic"
echo "[INFO] RasPi-Starter: Completed installing Neovim"


### Change default shell to Zsh
echo "[INFO] RasPi-Starter: Change default shell to Zsh"
declare ZSH_PATH="$(which zsh)"
chsh -s "${ZSH_PATH}"

echo "[INFO] RasPi-Starter: Setup completed!"
exec -l "${ZSH_PATH}"
