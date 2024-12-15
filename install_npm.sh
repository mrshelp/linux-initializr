#!/bin/bash

chk_npm() { chk_cmd npm; }

in_npm() {
  load_nvm
  nvm install-latest-npm
  nvm cache clear
}

check_install_npm() { check_install 'npm' $IM_ERR chk_npm in_npm; }
