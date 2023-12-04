#!/bin/sh -eu
if [ ! -e ~/.nix-profile ]; then
  # Some calls come before nix is even installed, e.g. building the user
  # environment that links to nix.
  printf >&2 'skipping %s before nix profile exists\n' "$DRV_PATH"
  printf >>~/tmpnix/logs/build.txt '%s ! %s %s\n' "$(date)" "$DRV_PATH" -
  exit 0
fi

if grep -q preferLocalBuild "$DRV_PATH"; then
  printf >&2 'skipping %s for preferLocalBuild\n' "$DRV_PATH"
  printf >>~/tmpnix/logs/build.txt '%s - %s %s\n' "$(date)" "$DRV_PATH" -
  exit 0
fi

printf >>~/tmpnix/logs/build.txt '%s + %s %s\n' "$(date)" "$DRV_PATH" -

printf >&2 'uploading %s\n' "$DRV_PATH"
~/tmpnix/upload.sh "$DRV_PATH^*"
