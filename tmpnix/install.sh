#!/bin/sh -eux
NIX_ASSET=https://cdn.glitch.me/5a9fc653-d4ea-4f87-b41f-2015392bbd4a/nix-202407a.tar.gz?v=1720073059275
NIX=/tmp/nix/store/vmk17av9wbmy452rf0ppb3qaigiia84f-nix-2.18.4

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
