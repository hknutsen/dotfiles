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
  readarray -t dotfiles < <(ls -A dotfiles)
else
  dotfiles=("$@")
fi
echo "Selected dotfiles:"
echo "${dotfiles[@]}"
echo ""

# Verify that selected dotfiles exist:
for file in "${dotfiles[@]}"; do
  if [[ ! -f "dotfiles/$file" ]]; then
    echo "$file does not exist in this repo"
    exit 1
  fi
done

if [[ "$confirm" == true ]]; then
  read -r -p "Copy selected dotfiles to home? (y/N) " response
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
