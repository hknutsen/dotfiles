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
printf "Selected dotfiles:\n"
printf "%s\n" "${dotfiles[@]}"
printf "\n"

# Verify that selected dotfiles exist:
for file in "${dotfiles[@]}"; do
  if [[ ! -f "dotfiles/$file" ]]; then
    printf "%s does not exist in this repo\n" "$file"
    exit 1
  fi
done

if [[ "$confirm" == true ]]; then
  read -r -p "Copy selected dotfiles to home? (y/N) " response
  case $response in
    [yY][eE][sS]|[yY])
      ;;
    *)
      printf "Exiting\n"
      exit 0
      ;;
  esac
fi

for file in "${dotfiles[@]}"; do
  printf "Copying %s to home\n" "$file"
  cp -r "dotfiles/$file" ~
done
