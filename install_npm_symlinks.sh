#!/bin/bash

chk_npm_symlinks() {
  local exists=0
  if [ -L /usr/bin/node ]; then
    exists=1
  fi
  for package in "${!LSP_SERVERS[@]}"; do
    if [ ! -L "/usr/bin/$package" ]; then
      exists=0
      break
    fi
  done
  [ $exists == 1 ]
}

in_npm_symlink() {
  local binary=$1
  if [ -L "/usr/bin/$binary" ]; then
    sudo rm "/usr/bin/$binary"
  fi
  local location=$(whereis "$binary" | sed "s/$binary: //g")
  if [ -n "$location" ]; then
    sudo ln -s "$location" "/usr/bin/$binary"
  fi
}

in_npm_symlinks() {
  in_npm_symlink node
  for binary in "${!LSP_SERVERS[@]}"
  do
    in_npm_symlink "$binary"
  done
}

check_install_npm_symlinks() { check_install 'npm symlinks' chk_npm_symlinks in_npm_symlinks $IM_ERR; }
