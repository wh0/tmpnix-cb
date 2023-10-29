#!/bin/sh -eux

mkdir -p ~/tmpnix/logs
touch ~/tmpnix/logs/build.txt

NIX_ASSET=https://cdn.glitch.me/e7db9df3-e53f-4dbb-8a80-8c10588888e3/nix-202310c.tar.gz?v=1698557962512
NIX=/tmp/nix/store/ymj5396pr9vrxyr8nvl4l7l4c4qc3pic-nix-2.13.6

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
