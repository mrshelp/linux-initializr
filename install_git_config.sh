#!/bin/bash

GIT_CRED='libsecret'
GIT_USER='Krystian Pypłacz'

chk_git_config() {
  local helper=$(git config --global credential.helper)
  local uname=$(git config --global user.name)
  [[ $helper == "$GIT_CRED" && $uname == "$GIT_USER" ]]
}

in_git_config() {
  git config --global credential.helper $GIT_CRED
  git config --global user.name "$GIT_USER"
}

check_install_git_config() { check_install 'git config' $IM_ERR chk_git_config in_git_config; }
