#!/bin/sh -eux
if [ ! -e /tmp/try ]; then
  exit 0
fi
rm /tmp/try

~/get-drvs.sh

if [ -s ~/watch-build-paths.txt ]; then
  nix-store -rvk $(cat ~/watch-build-paths.txt)
else
  outs=$(nix-store -rvk $(cat /tmp/top.txt))
  # ensure upload when some top entries are preferLocalBuild, e.g. clang_xx
  ~/tmpnix/upload.sh $outs
fi
