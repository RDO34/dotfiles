PACKAGES := zsh tmux ghostty git nvim scripts

.PHONY: install brew stow unstow restow

install:
	./bootstrap.sh

brew:
	brew bundle --file=Brewfile

stow:
	stow --target=$(HOME) $(PACKAGES)

restow:
	stow --target=$(HOME) --restow $(PACKAGES)

unstow:
	stow --target=$(HOME) --delete $(PACKAGES)
