#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=(zsh tmux ghostty git nvim scripts)

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

if ! command -v brew &>/dev/null; then
  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

log "Installing tools from Brewfile"
brew bundle --file="$DOTFILES/Brewfile"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "Installing oh-my-zsh"
  RUNZSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p "$HOME/.nvm"

log "Symlinking dotfiles with stow"
for pkg in "${PACKAGES[@]}"; do
  stow --dir="$DOTFILES" --target="$HOME" --restow "$pkg"
done

log "Done. Restart your shell or run: exec zsh"
