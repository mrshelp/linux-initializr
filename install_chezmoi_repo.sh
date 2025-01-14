#!/bin/bash

CHEZMOI_REPO_PATH=~/.local/share/chezmoi

chk_chezmoi_repo() {
  local dir_exists=$(test -d "$CHEZMOI_REPO_PATH" && echo 1 || echo 0)
  if [ $dir_exists == 1 ]; then
    local repo_owner=$(git -C "$CHEZMOI_REPO_PATH" remote get-url origin | sed 's/\// /g' | awk '{print $3}')
  fi
  [[ $dir_exists == 1 && "$repo_owner" == "$GITHUB_USER" ]]
}

in_chezmoi_repo() { chezmoi init --apply "$GITHUB_USER"; }

check_install_chezmoi_repo() {
  if [ -n "$GITHUB_USER" ]; then
    check_install 'chezmoi repo' $IM_ERR chk_chezmoi_repo in_chezmoi_repo;
  else
    echo_y "GITHUB_USER variable isn't set, skipping chezmoi repository initialization."
    echo_y "Run \"./install.sh config\" to set the missing variables."
    echo_y "To learn more about chezmoi visit: https://www.chezmoi.io/."
    echo
  fi
}
