#!/bin/sh -eu
if [ ! -e ~/.nix-profile ]; then
  # Some calls come before nix is even installed, e.g. building the user
  # environment that links to nix.
  printf >&2 'skipping %s before nix profile exists\n' "$DRV_PATH"
  printf >>~/tmpnix/logs/build.txt '%s ! %s %s\n' "$(date)" "$DRV_PATH" "$OUT_PATHS"
  exit 0
fi

if nix --extra-experimental-features nix-command show-derivation "$DRV_PATH" | grep -q preferLocalBuild; then
  printf >&2 'skipping %s for preferLocalBuild\n' "$DRV_PATH"
  printf >>~/tmpnix/logs/build.txt '%s - %s %s\n' "$(date)" "$DRV_PATH" "$OUT_PATHS"
  exit 0
fi

printf >>~/tmpnix/logs/build.txt '%s + %s %s\n' "$(date)" "$DRV_PATH" "$OUT_PATHS"

printf >&2 'uploading %s\n' "$DRV_PATH"
~/tmpnix/upload.sh $OUT_PATHS
