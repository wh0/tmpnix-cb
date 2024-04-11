#!/bin/sh -eu
test \
  -e ~/.data/cache-priv-key.pem -a \
  -e ~/.data/tmpnix.netrc -a \
  -e ~/.data/snail-persistent-token
