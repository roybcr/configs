#!/bin/zsh

# create a new note and open it in neovim with alacritty
alacritty -e lvim -- "$HOME/Documents/tmp/$(gendate).md"

