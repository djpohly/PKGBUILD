#!/bin/bash

set -ex

# Variables declaration.
declare -r reposlug="$1"
declare -r repotag="$2"
declare -r reponame="${1#*/}"
declare -r runid="$3"
declare SIGN_PKG=

# Environment variables.
export PACKAGER="https://github.com/$reposlug/actions/runs/$runid <pkgbuild@djpohly.com>"

# Set up gpg options
export GNUPGHOME="$PWD/.gnupg"
mkdir -p -m 700 "$GNUPGHOME"
echo 'auto-key-retrieve:0:1' | gpgconf --change-options gpg
echo 'keyserver:0:"hkps%3a//keyserver.ubuntu.com' | gpgconf --change-options dirmngr
gpgconf --reload all
# HACK: auto-key-retrieve doesn't currently retrieve based on keyid alone
gpg --recv-key $(source PKGBUILD && echo "${validpgpkeys[@]}")
if [[ -r master/signing.key ]]; then
  gpg --import master/signing.key
  gpg --export --armor | sudo tee /usr/share/pacman/keyrings/pkgbuild.gpg >/dev/null
  gpg -k --with-colons | grep -m1 '^fpr' | cut -d: -f10 | sed 's/$/:4:/' | sudo tee /usr/share/pacman/keyrings/pkgbuild-trusted >/dev/null
  sudo rm -rf /etc/pacman.d/gnupg
  sudo pacman-key --init
  sudo pacman-key --populate archlinux pkgbuild
  SIGN_PKG=--sign
fi

# Enable multilib repository.
sudo sed -i -e "/\[multilib\]/,/Include/s/^#//" "/etc/pacman.conf"

# Add configuration for repository.
cat - /etc/pacman.conf > /tmp/pacman.conf.new << EOF
[${reponame}]
SigLevel = Optional TrustAll
Server = https://github.com/${reposlug}/releases/download/${repotag}
EOF
sudo cp /tmp/pacman.conf.new /etc/pacman.conf

# Sync repositories
sudo pacman -Sy

export PKGDEST=repo LC_MESSAGES=C LANG=C

# Build and sign packages
makepkg -Lcs --noconfirm --nocheck $SIGN_PKG

# Build repo update
# HACK: why does `makepkg --packagelist` include debug here if not built above?
makepkg --packagelist | grep -v -- '-debug-' | while read -r filename; do
  newfname=${filename//:/.}
  if [[ "$filename" != "$newfname" ]]; then
    mv -n "$filename" "$newfname"
    mv -n "$filename.sig" "$newfname.sig"
  fi
  repo-add master/pkgbuild.db.tar "$newfname"
done

{ set +ex; } 2>/dev/null
