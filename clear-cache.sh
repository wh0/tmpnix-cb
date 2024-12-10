#!/bin/sh -eux
if [ -e ~/.cache/nix/binary-cache-v6.sqlite ]; then
  sqlite3 ~/.cache/nix/binary-cache-v6.sqlite 'DELETE FROM NARs WHERE present = 0;'
fi
