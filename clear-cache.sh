#!/bin/sh -eux
if [ -e ~/.cache/nix/binary-cache-v6.sqlite ]; then
  rm -v ~/.cache/nix/binary-cache-v6.sqlite*
fi
