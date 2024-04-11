#!/bin/sh -eux
if [ ! -e /tmp/top.txt ]; then
  curl -fo /tmp/top.txt 'https://tmpnix-gsdrv.glitch.me/dev/top.txt'
fi
if [ ! -e "$(head -n1 /tmp/top.txt)" ]; then
  curl https://tmpnix-gsdrv.glitch.me/dev/drvs.nar.gz \
    | gzip -d \
    | ~/tmpnix/wrapped.sh nix-store --import >/dev/null
fi
