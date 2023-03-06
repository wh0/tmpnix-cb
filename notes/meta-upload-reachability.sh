#!/bin/sh -eu

ok=0
fail=0

for i in $(seq 100); do
  if curl -sf 'https://tmpnix-uploader.glitch.me/' >/dev/null; then
    ok=$((ok + 1))
    printf '.'
  else
    fail=$((fail + 1))
    printf 'x'
  fi
done
printf '\nok=%s fail=%s\n' "$ok" "$fail"
