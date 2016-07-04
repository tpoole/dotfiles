SHELL := /bin/bash

DIRECTORIES := $(abspath $(shell ls -d dotfiles/*/))

.PHONY: all $(DIRECTORIES)

all: $(DIRECTORIES)

$(DIRECTORIES):
	for x in `ls -A $@`; do ln -sf $@/$$x ~; done
