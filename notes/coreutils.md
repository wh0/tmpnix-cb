FAIL: tests/misc/mknod
======================

mknod: cannot set permissions of 'f1': Operation not permitted
mkfifo: cannot set permissions of 'f2': Operation not permitted
FAIL tests/misc/mknod.sh (exit status: 1)

new fchmodat2 in glibc

ERROR: tests/ls/acl
===================

acl.sh: set-up failure: 
ERROR tests/ls/acl.sh (exit status: 99)

~/tmpnix/wrapped.sh nix-store -rK /tmp/nix/store/swaf3b4sa2m2812fnsyh2p2b2ssg26pr-coreutils-9.5.drv
/tmp/nix/store/db1a09v5saj43jfdf9wz7wzagjzmk6pa-bootstrap-tools/bin/bash -c '. ../env-vars && make check'

https://github.com/NixOS/nix/blob/2.18.1/src/libstore/build/local-derivation-goal.cc#L1670
nix disable seccomp for build processes, so
https://git.savannah.gnu.org/cgit/coreutils.git/tree/tests/ls/acl.sh?h=v9.5#n30
this new test fails
note that other acl-related tests skip if setfacl fails
note that normal nix has no 'bin' user in the sandbox
