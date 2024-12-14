#!/bin/bash

GITHUB_USER='mrshelp'

chk_chezmoi_repo() { test -d ~/.local/share/chezmoi; }

in_chezmoi_repo() { chezmoi init --apply $GITHUB_USER; }

check_install_chezmoi_repo() { check_install 'chezmoi repo' $IM_ERR chk_chezmoi_repo in_chezmoi_repo; }
