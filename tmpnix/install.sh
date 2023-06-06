#!/bin/sh -eux

mkdir -p ~/tmpnix/logs
touch ~/tmpnix/logs/build.txt

NIX_ASSET=https://cdn.glitch.me/e7db9df3-e53f-4dbb-8a80-8c10588888e3/nix-202306a.tar.gz?v=1686025822850
NIX=/tmp/nix/store/bvrj8yvc3bx98y90r0xfm75pkqvv4pa5-nix-2.13.3

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
