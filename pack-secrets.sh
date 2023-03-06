#!/bin/sh -eux
tar -cz \
  .data/cache-priv-key.pem \
  .data/tmpnix.netrc \
  .data/snail-persistent-token \
  | gpg -c >~/secrets.tar.gz.gpg
