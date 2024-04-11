#!/bin/sh -eu
if grep -q preferLocalBuild "$DRV_PATH"; then
  printf >&2 'skipping %s for preferLocalBuild\n' "$DRV_PATH"
  printf >>~/tmpnix/logs/build.txt '%s - %s %s\n' "$(date)" "$DRV_PATH" -
  exit 0
fi

printf >>~/tmpnix/logs/build.txt '%s H %s %s\n' "$(date)" "$DRV_PATH" -

printf >&2 'uploading %s\n' "$DRV_PATH"
~/tmpnix/upload-inner.sh "$DRV_PATH^*"
