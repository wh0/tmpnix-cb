#!/bin/sh -eux
RELEASE_URL=$(curl -sSf 'https://tmpnix-gsdrv.glitch.me/dev/release-url.txt')
~/tmpnix/wrapped.sh nix-instantiate "$RELEASE_URL/nixexprs.tar.xz" -A "$1"
