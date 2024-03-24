#! /bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")/dotfiles" || exit
rsync -avh --no-perms . ~
source ~/.bash_profile
