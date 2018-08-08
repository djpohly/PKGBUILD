#!/bin/bash

set -ex

# Variables declaration.
declare -r pkgslug="$1"
declare -r pkgtag="$2"
declare -r pkgrepo="${1#*/}"

# Download or create repository database.
mkdir repo
cd repo
if curl -L -O -O -f "https://github.com/${pkgslug}/releases/download/${pkgtag}/${pkgrepo}.{db,files}.tar.gz"; then
  ln -fs "${pkgrepo}.db.tar.gz" "${pkgrepo}.db"
  ln -fs "${pkgrepo}.files.tar.gz" "${pkgrepo}.files"
else
  rm -f "${pkgrepo}.db.tar.gz" "${pkgrepo}.files.tar.gz"
  repo-add "${pkgrepo}.db.tar.gz"
fi
cd ".."

# Enable multilib repository.
sudo sed -i -e "/\[multilib\]/,/Include/s/^#//" "/etc/pacman.conf"

# Add configuration for repository.
sudo tee -a "/etc/pacman.conf" << EOF
[options]
CacheDir = /var/cache/pacman/pkg
CacheDir = $(pwd)/repo
CleanMethod = KeepCurrent

[${pkgrepo}]
SigLevel = Optional TrustAll
Server = file://$(pwd)/repo
Server = https://github.com/${pkgslug}/releases/download/${pkgtag}
EOF

# Sync repositories
sudo pacman -Sy

{ set +ex; } 2>/dev/null
