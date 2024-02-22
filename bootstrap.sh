#! /bin/bash

set -eu

force_copy=false
while getopts "f" opt; do
  case $opt in
    f)
      force_copy=true
      ;;
    *)
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

cd "$(dirname "${BASH_SOURCE[0]}")"

dotfiles=${1:-""}
if [[ -z "$dotfiles" ]]; then
  dotfiles=$(ls -A dotfiles)
fi
echo -e "Dotfiles:\n$dotfiles\n"

if [[ "$force_copy" == false ]]; then
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

for file in $dotfiles; do
  echo "Copying $file to home"
  cp -r "dotfiles/$file" ~
done
