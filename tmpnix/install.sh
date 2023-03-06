#!/bin/sh -eux

mkdir -p ~/tmpnix/logs
touch ~/tmpnix/logs/build.txt

if [ ! -e /tmp/unpacked ]; then
  rm -rf /tmp/nix
  curl -L 'https://cdn.glitch.me/3f7fc1ee-0e69-41b0-980f-f32d1f89f671/nix-202302a.tar.gz?v=1677220350233' | tar -xzC /tmp
  touch /tmp/unpacked
fi

NIX=/tmp/nix/store/fdwkwanm9dgcb1krcvz9cw1h4yz464yz-nix-2.11.1

. "$NIX/etc/profile.d/nix.sh"

if ! type nix >&2; then
  "$NIX/bin/nix-env" -i "$NIX"
fi
