```
app@tmpnix-builder:~ 02:14 
$ nix-store -r /tmp/nix/store/kkmsqlm4dcd0dc8xvxgk80xwxrzh0v43-libredirect-0.drv
this derivation will be built:
  /tmp/nix/store/kkmsqlm4dcd0dc8xvxgk80xwxrzh0v43-libredirect-0.drv
building '/tmp/nix/store/kkmsqlm4dcd0dc8xvxgk80xwxrzh0v43-libredirect-0.drv'...
unpacking sources
patching sources
configuring
no configure script, doing nothing
building
/tmp/nix/store/8dj3c1bx6y4qincclpnkspaybh50fqqq-binutils-2.38/bin/ld: /tmp/nix-build-libredirect-0.drv-0/ccBAdf5K.o: in function `main':
test.c:(.text.startup+0x2c3): warning: the use of `mktemp' is dangerous, better use `mkstemp' or `mkdtemp'
installing
install: creating directory '/tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0'
install: creating directory '/tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0/lib'
'libredirect.so' -> '/tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0/lib/libredirect.so'
post-installation fixup
shrinking RPATHs of ELF executables and libraries in /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0
shrinking /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0/lib/libredirect.so
patching script interpreter paths in /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0
checking for references to /tmp/nix-build-libredirect-0.drv-0/ in /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0...
shrinking RPATHs of ELF executables and libraries in /tmp/nix/store/sba4mv7hyp2a5g5la8xq73lafzwz8w6n-libredirect-0-hook
patching script interpreter paths in /tmp/nix/store/sba4mv7hyp2a5g5la8xq73lafzwz8w6n-libredirect-0-hook
checking for references to /tmp/nix-build-libredirect-0.drv-0/ in /tmp/nix/store/sba4mv7hyp2a5g5la8xq73lafzwz8w6n-libredirect-0-hook...
running install tests
sh: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0/lib/libredirect.so)
test: test.c:41: test_system: Assertion `system(TESTPATH) == 0' failed.
/tmp/nix/store/9d5qj0cv5f3crdgm3hqykivmfzh1armg-stdenv-linux/setup: line 1376:  6049 Aborted                 (core dumped) NIX_REDIRECTS="/foo/bar/test=/tmp/nix/store/yq7vay6cz42bm6hg2kdapp9jqqsyg3d8-coreutils-9.0/bin/true:/bar/baz=$(mktemp -d)" ./test
error: builder for '/tmp/nix/store/kkmsqlm4dcd0dc8xvxgk80xwxrzh0v43-libredirect-0.drv' failed with exit code 134
```

https://github.com/NixOS/nixpkgs/issues/164754

---

patched out the `system` tests. they don't work

oh there's a PR for it now https://github.com/NixOS/nixpkgs/pull/216342
hopefully our patch will conflict and we'll know to take ours out when that ships
