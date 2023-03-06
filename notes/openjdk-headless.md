```sh
nix --extra-experimental-features nix-command copy --to file:///tmp/j?secret-key=/app/.data/cache-priv-key.pem /tmp/nix/store/7mqh5i48y64kr1qvyzfb10cdvxsjliri-openjdk-headless-17.0.3+7
tar -cvf /tmp/j.tar -C /tmp/j nix-cache-info 7mqh5i48y64kr1qvyzfb10cdvxsjliri.narinfo nar/09yrxj22fmhlw68fjvn07ks6i303yldzc5h28k72alc0rrx9b2nk.nar.xz
ln -s /tmp/j.tar ~/greeter
```

