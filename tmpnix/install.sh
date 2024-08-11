#!/bin/sh -eux
NIX_ASSET=https://cdn.glitch.me/5a9fc653-d4ea-4f87-b41f-2015392bbd4a/nix-202408a.tar.gz?v=1723398673246
NIX=/tmp/nix/store/61ja88a5i60gwj1qanvv5y9bp1cxah8d-nix-2.18.5

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
