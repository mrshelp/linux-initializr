#!/bin/bash

NVM_PATH="$HOME/.nvm"

chk_nvm() { test -s "$NVM_PATH/nvm.sh"; }

load_nvm() {
  if chk_nvm && ! chk_cmd nvm; then
    set +e
    \. "$NVM_PATH/nvm.sh"
    set -e
  fi
}

in_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  load_nvm
}

check_install_nvm() { check_install 'nvm' $IM_ERR chk_nvm in_nvm; }
