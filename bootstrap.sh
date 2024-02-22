#! /bin/bash

set -eu

cd "$(dirname "${BASH_SOURCE[0]}")"

dotfiles=${1:-""}
if [[ -z "$dotfiles" ]]; then
  dotfiles=$(ls -A dotfiles)
fi
echo -e "Dotfiles:\n$dotfiles\n"

read -r -p "Copy dotfiles to home? (y/N) " response
case $response in
  [yY][eE][sS]|[yY])
    ;;
  *)
    echo "Exiting"
    exit 0
    ;;
esac

for file in $dotfiles; do
  echo "Copying $file to home"
  cp -r "dotfiles/$file" ~
done
