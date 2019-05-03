stowdirs=$(wildcard */)

.PHONY: stow
stow:
	stow -v $(stowdirs)

.PHONY: dry-run
dry-run:
	stow --no -v $(stowdirs)

.PHONY: restow
restow:
	stow -v -R $(stowdirs)
