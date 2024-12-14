#!/bin/bash

chk_docker_config() {
  local stat=$(stat -c %A /var/run/docker.sock 2> /dev/null)
  id -nG "$USER" | grep -qw docker \
  && systemctl is-enabled docker.service > /dev/null \
  && systemctl is-active docker.service > /dev/null \
  && test "${stat:4:1}" == 'r' \
  && test "${stat:1:1}" == 'r'
}

in_docker_config() {
  if ! grep -q docker /etc/group; then
    sudo groupadd docker
  fi
  sudo usermod -aG docker "$USER"
  sudo systemctl enable docker.service
  sudo systemctl start docker.service
  sudo chmod u+r /var/run/docker.sock
  sudo chmod g+r /var/run/docker.sock
}

check_install_docker_config() { check_install 'docker config' $IM_ERR chk_docker_config in_docker_config; }
