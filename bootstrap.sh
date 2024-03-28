#! /bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# Build config
declare -A config_dir
config_dir["bash"]="$HOME"
config_dir["git"]="$HOME"
config_dir["pipewire"]="$HOME/.config/pipewire"
# config_dir["quodlibet"]="$HOME/.config/quodlibet"

# Create symbolic links
for package in "${!config_dir[@]}"; do
  target_dir="${config_dir[$package]}"
  stow -v -R -t "$target_dir" "$package"
done

source ~/.bash_profile
