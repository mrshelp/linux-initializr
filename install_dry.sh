#!/bin/bash

chk_dry() { test -s /usr/local/bin/dry; }

in_dry() {
  curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
  sudo chmod 755 /usr/local/bin/dry
}

check_install_dry() { check_install 'dry' $IM_ERR chk_dry in_dry; }
