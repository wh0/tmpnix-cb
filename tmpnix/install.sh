#!/bin/sh -eux

mkdir -p ~/tmpnix/logs
touch ~/tmpnix/logs/build.txt

NIX_ASSET=https://cdn.glitch.me/e7db9df3-e53f-4dbb-8a80-8c10588888e3/nix-202402b.tar.gz?v=1708833736890
NIX=/tmp/nix/store/ypm083djwliqndbdjmkyqin1ml6x42s7-nix-2.18.1

if [ ! -e /tmp/unpacked ]; then
  test ! -e /tmp/nix
  curl -L "$NIX_ASSET" | tar -xzC /tmp
  touch /tmp/unpacked
fi

. "$NIX/etc/profile.d/nix.sh"

if ! type nix >&2; then
  printf >>~/tmpnix/logs/build.txt '\n'
  "$NIX/bin/nix-env" -i "$NIX"
fi
