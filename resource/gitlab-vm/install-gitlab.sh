#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl openssh-server ca-certificates postfix -y
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt install gitlab-ce -y