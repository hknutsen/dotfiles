#! /bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")/.." || exit

dotfile=".config/MusicBrainz/Picard.ini"

source_file="$HOME/$dotfile"
target_file="dotfiles/$dotfile"
target_dir=$(dirname "$target_file")
if [[ ! -d "$target_dir" ]]; then
  mkdir -p "$target_dir"
fi
cp "$source_file" "$target_file"
