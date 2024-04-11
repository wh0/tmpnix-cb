#!/bin/sh -eu
/tmp/out/nix/bin/nix \
  --extra-experimental-features nix-command \
  copy \
  --to "https://tmpnix-uploader.glitch.me/cache?secret-key=$HOME/.data/cache-priv-key.pem" \
  "$@"
