#!/bin/sh -eux
./tmpnix/install.sh

mkdir -p ~/tmpnix/logs
touch ~/tmpnix/logs/build.txt

if [ ! -e /tmp/logs-separator-added ]; then
  printf >>~/tmpnix/logs/build.txt '\n'
  touch /tmp/logs-separator-added
fi

if [ ! -e /tmp/try ]; then
  exit 0
fi
rm /tmp/try

~/get-drvs.sh

if [ -s /tmp/job.txt ]; then
  ~/tmpnix/wrapped.sh nix-store -rvk $(cat /tmp/job.txt)
else
  ~/tmpnix/wrapped.sh nix-store -rvk $(cat /tmp/top.txt)
  # ensure upload when some top entries are preferLocalBuild, e.g. clang_xx
  ~/tmpnix/upload.sh $(cat /tmp/top.txt)
fi
