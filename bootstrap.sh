#! /bin/bash

set -eu

cd "$(dirname "${BASH_SOURCE[0]}")"

dotfiles=$(ls -A dotfiles)

for f in $dotfiles; do
  read -r -p "Copy dotfile $f to home? (Y/n) " response
  case $response in
    [nN][oO]|[nN])
      echo "Skipping $f"
      ;;
    *)
      cp -r "dotfiles/$f" ~
      ;;
  esac
done
