#!/bin/bash

set -ouex pipefail

dnf5 group install -y development-tools
dnf5 install -y  procps-ng curl file git

dnf5 install -y zsh zsh-autosuggestions
dnf5 install -y opendoas
dnf5 install -y fish

dnf5 remove -y firefox
dnf5 remove -y nvtop
dnf5 remove -y cosmic-edit
dnf5 remove -y cosmic-player
dnf5 remove -y cosmic-store

systemctl enable podman.socket
