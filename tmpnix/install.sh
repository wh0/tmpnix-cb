#!/bin/sh -eux
NIX_ASSET=https://cdn.glitch.me/5a9fc653-d4ea-4f87-b41f-2015392bbd4a/nix-202503b.tar.gz?v=1742843206710
NIX=/tmp/nix/store/2x0g99kfh9vkfh67n238324andl2mq91-nix-2.24.12

mkdir -p /tmp/nix-cache
if [ ! -e ~/.cache/nix ]; then
  mkdir -p ~/.cache
  ln -s /tmp/nix-cache ~/.cache/nix
fi

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
