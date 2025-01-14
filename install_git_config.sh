#!/bin/bash

GIT_CRED='libsecret'

chk_git_helper() { [[ "$(git config --global credential.helper)" == "$GIT_CRED" ]]; }
chk_git_username() { [[ "$(git config --global user.name)" == "$GIT_USER" ]]; }

in_git_helper() { git config --global credential.helper $GIT_CRED; }
in_git_username() { git config --global user.name "$GIT_USER"; }

check_install_git_config() {
  check_install 'git credential helper' $IM_ERR chk_git_helper in_git_helper;
  if [ -n "$GIT_USER" ]; then
    check_install 'git username' $IM_ERR chk_git_username in_git_username;
  else
    echo_y "GIT_USER variable isn't set, skipping setting git username."
    echo_y "Run \"./install.sh config\" to set the missing variables."
    echo
  fi
}
