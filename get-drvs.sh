#!/bin/sh -eux
if [ ! -e /tmp/top.txt ]; then
  curl -fo /tmp/top.txt https://tmpnix-gsdrv.glitch.me/top.txt
fi
if [ ! -e /tmp/drvs.tar.gz ]; then
  curl -fo /tmp/drvs.tar.gz https://tmpnix-gsdrv.glitch.me/drvs.tar.gz
fi
if [ ! -e /tmp/drvs ]; then
  mkdir -p /tmp/drvs
  tar -xf /tmp/drvs.tar.gz -C /tmp/drvs
fi
nix \
  --extra-experimental-features nix-command \
  copy \
  --derivation \
  --from file:///tmp/drvs \
  $(cat /tmp/top.txt)
