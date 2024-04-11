#!/bin/sh -eu
printf 'output path(s) (e.g. /tmp/nix/store/xxx-nix-x.x.x): '
read paths
printf 'archive name (e.g. nix-yyyymmx.tar.gz): '
read name
set -x
test ! -e /tmp/pack
~/tmpnix/wrapped.sh nix --extra-experimental-features nix-command copy --no-check-sigs --to /tmp/pack $paths
tar -czvf "/tmp/$name" -C /tmp/pack nix
ls -lh "/tmp/$name"
snail ot request-join -r -p "$PROJECT_DOMAIN"
url=$(snail asset push -p "$PROJECT_DOMAIN" "/tmp/$name")
snail member leave -p "$PROJECT_DOMAIN"
set +x
printf 'NIX_ASSET=%s\n' "$url"
printf 'NIX=%s\n' "$paths"
