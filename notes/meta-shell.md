```
~/instantiate.sh bashInteractive
```

get out path

~/tmpnix/wrapped.sh nix-store -r outpath

NIX_BUILD_SHELL=outpath/bin/bash nix-shell drvpath
