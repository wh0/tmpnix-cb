nodejs 22 takes more than 12 hours
nodejs builds build twice due to cross-compiling support
fixed in nixos 24.11
now only takes ~4h2m to build nodejs 20
~6h55m to build nodejs 22 without ccache

tests are pretty task-heavy, probably build with cores = 1
