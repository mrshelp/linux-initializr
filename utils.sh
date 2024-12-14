#!/bin/bash

COLOR_RED='\e[31m'
COLOR_GREEN='\e[32m'
COLOR_BLUE='\e[34m'
COLOR_RESET='\e[0m'

echo_color() { echo -e "$1$2$COLOR_RESET"; }
echo_r() { echo_color "$COLOR_RED" "$1"; }
echo_g() { echo_color "$COLOR_GREEN" "$1"; }
echo_b() { echo_color "$COLOR_BLUE" "$1"; }

chk_cmd() { command -v "$1" &> /dev/null; }

check_permissions() { if [ -w '/root' ]; then echo_r "Don't run this script as root."; exit; fi; }

IM_ERR='error'
IM_INF='info'
install() {
  local name=$1
  local mode=$2
  local func=$3
  local func_params=$4
  case $mode in
    "$IM_INF")
      echo_b "Installing $name..."
      ;;
    *)
      echo_r "$name not found, installing..."
      ;;
  esac
  $func $func_params
  echo_g "$name successfully installed.\n"
}

check_install() {
  local name=$1
  local mode=$2
  local condition=$3
  local func=$4
  local func_params=$5
  echo_b "Checking if $name is installed..."
  if ! $condition; then
    install "$name" "$mode" "$func" "$func_params"
  else
    echo_g "$name is already installed.\n"
  fi
}
