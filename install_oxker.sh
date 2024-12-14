#!/bin/bash

chk_oxker() { test -s /usr/local/bin/oxker; }

in_oxker() {
  curl https://raw.githubusercontent.com/mrjackwills/oxker/main/install.sh | bash
  sudo mv "$HOME/.local/bin/oxker" /usr/local/bin/
}

check_install_oxker() { check_install 'oxker' $IM_ERR chk_oxker in_oxker; }
