#!/bin/sh -eux
NIX_ASSET=https://cdn.glitch.me/e7db9df3-e53f-4dbb-8a80-8c10588888e3/nix-202403a.tar.gz?v=1710907735476
NIX=/tmp/nix/store/avkfmya7s1bjc68pkvlmbgrpy92h051d-nix-2.18.1

if [ ! -e /tmp/nix ]; then
  if [ -e /tmp/unpack.tmp ]; then
    chmod -R +w /tmp/unpack.tmp
    rm -rf /tmp/unpack.tmp
  fi
  mkdir /tmp/unpack.tmp
  curl -L "$NIX_ASSET" | tar -xzC /tmp/unpack.tmp
  mv /tmp/unpack.tmp/nix /tmp
  rmdir /tmp/unpack.tmp
fi

. ~/tmpnix/vars.sh
"$NIX/bin/nix-store" -r "$NIX" --add-root /tmp/out/nix
