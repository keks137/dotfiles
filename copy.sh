#!/bin/sh
set -x
WORK_DIR="$(pwd)"

cp -r ~/.config/alacritty .
cp -r ~/.config/godot .
cp -r ~/.config/kitty .
cp -r ~/.config/rofi .
cp -r ~/.config/tmux .
cp  ~/.config/starship.toml .
cp  ~/.zshrc .

cd "nvim"
git pull ~/.config/nvim
cd "$WORK_DIR"

cd "hypr"
git pull ~/.config/hypr
cd "$WORK_DIR"

