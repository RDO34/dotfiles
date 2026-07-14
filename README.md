# dotfiles

Personal macOS development environment — config + a one-shot setup.

Managed with [GNU Stow](https://www.gnu.org/software/stow/): each top-level
directory is a "package" whose contents mirror `$HOME`. Stow symlinks them into
place, so the repo stays the single source of truth and edits are live.

## Layout

```
zsh/      → ~/.zshrc ~/.zprofile ~/.zshenv
tmux/     → ~/.tmux.conf
ghostty/  → ~/.config/ghostty/config
git/      → ~/.gitconfig ~/.config/git/ignore
nvim/     → ~/.config/nvim (LazyVim)
scripts/  → ~/bin (session, session-main, ns)
Brewfile  → tools installed via `brew bundle`
bootstrap.sh / Makefile → install + link
```

## Fresh machine

```sh
git clone <this-repo> ~/projects/dotfiles
cd ~/projects/dotfiles
./bootstrap.sh
```

`bootstrap.sh` is idempotent. It:

1. installs Homebrew if missing,
2. `brew bundle`s everything in `Brewfile` (tmux, neovim, nvm, eza, ghostty, …),
3. installs oh-my-zsh (keeps this repo's `.zshrc`),
4. stows every package into `$HOME`.

## Day to day

```sh
make restow    # re-link after adding files
make unstow    # remove all symlinks
make brew      # sync tools from Brewfile
```

Adding a config: drop it under the matching package mirroring its `$HOME`
path, then `make restow`. If Stow refuses because a real file already exists
there, move the real file into the package first (or `stow --adopt <pkg>`).

## Notes

- Private/work scripts (`~/bin`), credentials, and proprietary tooling are
  intentionally **excluded**.
- `nvm` is installed via Homebrew; `bootstrap.sh` creates `~/.nvm`. Node
  versions are not managed here — install with `nvm install --lts`.
- Some `.zshrc` integrations (gcloud, bun, deno, Android SDK) are lazy/guarded
  and no-op if that tool isn't installed.
