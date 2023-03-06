#!/bin/sh -eu
n=$(date +%s)
for d in /tmp/nix-build-*; do
  a=$(stat -c %X "$d")
  echo "$(date -d "@$((n - a))" -u +%T) $d"
done
