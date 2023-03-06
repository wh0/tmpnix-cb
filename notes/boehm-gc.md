```
make  check-TESTS
make[2]: Entering directory '/tmp/nix-build-boehm-gc-8.0.6.drv-0/gc-8.0.6'
make[3]: Entering directory '/tmp/nix-build-boehm-gc-8.0.6.drv-0/gc-8.0.6'
PASS: cordtest
PASS: middletest
PASS: smashtest
PASS: hugetest
PASS: realloc_test
PASS: staticrootstest
PASS: test_atomic_ops
PASS: threadleaktest
PASS: threadkey_test
make[3]: /tmp/nix/store/91gza0zcl96wz8pkhjqdqlxvlwnlf51g-bash-5.1-p16/bin/bash: Operation not permitted
make[3]: *** [Makefile:2150: subthreadcreate_test.log] Error 127
make[3]: Leaving directory '/tmp/nix-build-boehm-gc-8.0.6.drv-0/gc-8.0.6'
make[2]: *** [Makefile:2048: check-TESTS] Error 2
make[2]: Leaving directory '/tmp/nix-build-boehm-gc-8.0.6.drv-0/gc-8.0.6'
make[1]: *** [Makefile:2396: check-am] Error 2
make[1]: Leaving directory '/tmp/nix-build-boehm-gc-8.0.6.drv-0/gc-8.0.6'
make: *** [Makefile:1825: check-recursive] Error 1
builder for '/tmp/nix/store/qkjjynmwsig6ax1r8ldw55njkpd6w78f-boehm-gc-8.0.6.drv' failed with exit code 2
```

cd /tmp/nix-build-boehm-gc-8.0.6.drv-0
/tmp/nix/store/91gza0zcl96wz8pkhjqdqlxvlwnlf51g-bash-5.1-p16/bin/bash
. env-vars
cd gc-*

first try of `make check-TESTS` fails with "Operation not permitted"
hm retrying `make check-TESTS` succeeds
`make subthreadcreate_test.log` succeeds too

it's just flaky. retry it
https://github.com/ivmai/bdwgc/commit/e06f67c7c5bd181564162e52338f9b10562a2c15
