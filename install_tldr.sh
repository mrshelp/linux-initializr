#!/bin/bash

chk_tldr() { chk_cmd tldr; }

in_tldr() { npm i -g tldr; }

check_install_tldr() { check_install 'tldr' $IM_ERR chk_tldr in_tldr; }
