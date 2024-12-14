#!/bin/bash

declare -A LSP_SERVERS=(
  ['docker-langserver']='dockerfile-language-server-nodejs'
  ['bash-language-server']='bash-language-server'
  ['yaml-language-server']='yaml-language-server'
  ['vscode-json-languageserver']='vscode-json-languageserver'
)

chk_lsp_servers() {
  local installed=1
  local npm_list=$(npm list -g --depth=0)
  for package in "${!LSP_SERVERS[@]}"; do
    if ! echo "$npm_list" | grep -q "${LSP_SERVERS[$package]}"; then
      installed=0
      break
    fi
  done
  [ $installed == 1 ]
}

in_lsp_servers() {
  for package in "${!LSP_SERVERS[@]}"; do
    npm i -g "${LSP_SERVERS[$package]}"
  done
}

check_install_lsp_servers() { check_install 'LSP servers' $IM_ERR chk_lsp_servers in_lsp_servers; }
