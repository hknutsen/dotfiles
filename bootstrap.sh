#! /bin/bash

set -eu

confirm=true
while getopts "f" opt; do
  case $opt in
    f)
      confirm=false
      ;;
    *)
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $# -eq 0 ]]; then
  mapfile -t dotfiles < <(ls -A dotfiles)
else
  dotfiles=("$@")
fi
echo "Dotfiles:"
echo "${dotfiles[@]}"
echo ""

if [[ "$confirm" == true ]]; then
  read -r -p "Copy dotfiles to home? (y/N) " response
  case $response in
    [yY][eE][sS]|[yY])
      ;;
    *)
      echo "Exiting"
      exit 0
      ;;
  esac
fi

for file in "${dotfiles[@]}"; do
  echo "Copying $file to home"
  cp -r "dotfiles/$file" ~
done
