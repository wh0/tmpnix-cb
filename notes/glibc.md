
test in
glibc-2.34/sysdeps/pthread
https://sourceware.org/glibc/wiki/Testing/Testsuite

```sh
nix-store -rvK /tmp/nix/store/ddx7p9nk72jj30f7k1cfznijadx62w8f-glibc-2.34-210.drv
cd /tmp/nix-build-glibc-2.34-210.drv-0
/tmp/nix/store/1ql0yag0dqa7dcy6gqz49d65yds5nmli-bootstrap-tools/bin/bash
. env-vars
cd build
make $makeFlags -j8 check
make $makeFlags subdirs=posix check
make $makeFlags t=posix/bug-glob2-mem test
make $makeFlags t=posix/tst-spawn test
make $makeFlags t=sysdeps/pthread/tst-basic1 test
```

upload these pending testing:

```
/tmp/nix/store/0bb97hrl8fqis7x7gz5945hv07gzfr74-glibc-2.34-210-debug
/tmp/nix/store/3n463hfnqhy2rj6xfx75kfzdwb5nhzlk-glibc-2.34-210-static
/tmp/nix/store/5yhmfi4934gqfrjyn16mra8ylg2nz1hm-glibc-2.34-210
/tmp/nix/store/kzqk2mk0kvakj45625w42089hm6z9a7j-glibc-2.34-210-bin
/tmp/nix/store/rjq2201n6fnx4ma4w204z2ajxndcgah7-glibc-2.34-210-dev
```

added patch
