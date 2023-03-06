```
...

make  -f CMakeFiles/check-all.dir/build.make CMakeFiles/check-all.dir/build

make[3]: Entering directory '/tmp/nix-build-llvm-14.0.1.drv-0/llvm-src-14.0.1/llvm/build'

[100%] Running all regression tests

/tmp/nix/store/m9y70jhmv9bibgg2q44wsz201mlfpnmz-python3-3.9.12/bin/python3.9 /tmp/nix-build-llvm-14.0.1.drv-0/llvm-src-14.0.1/llvm/build/./bin/llvm-lit -sv /tmp/nix-build-llvm-14.0.1.drv-0/llvm-src-14.0.1/llvm/build/utils/lit /tmp/nix-build-llvm-14.0.1.drv-0/llvm-src-14.0.1/llvm/build/test

llvm-lit: /tmp/nix-build-llvm-14.0.1.drv-0/llvm-src-14.0.1/llvm/build/utils/lit/tests/lit.cfg:92: warning: Setting a timeout per test not supported. Requires the Python psutil module but it could not be found. Try installing it via pip or via your operating system's package manager.

 Some tests will be skipped and the --timeout command line argument will not work.
```

it hangs for a long time here, no cpu use, then it starts running tests
what do you know, it finishes successfully even
~9h38m
Thu Jun  9 20:13:01 UTC 2022 - /tmp/nix/store/j6fy7faar2a7si9f86q7m0xnkrmw760k-cargo-vendor-normalise.drv /tmp/nix/store/wp2mbav8lly42pm0nx0cwvcjzc7ghilb-cargo-vendor-normalise
Fri Jun 10 05:51:38 UTC 2022 + /tmp/nix/store/n6y04i0l5qbklkvk5djhck1i04dbxxd9-llvm-14.0.1.drv /tmp/nix/store/7z7z3czq5av64hb02sdgmznaxisz1c3i-llvm-14.0.1 /tmp/nix/store/bf9bbk76wwaabljwgm8pvc3iw96zmlra-llvm-14.0.1-dev /tmp/nix/store/bl2pb77a9zr36vx8nnvzb9gvqgsblfay-llvm-14.0.1-python /tmp/nix/store/fmk97l8xws5brymwwv06fawjyv13y2h5-llvm-14.0.1-lib

---

/tmp/nix-build-llvm-14.0.6.drv-0/llvm-src-14.0.6/llvm/build/bin/llvm-exegesis
-mode latency
-x86-lbr-sample-period 123
-repetition-mode loop
-snippets-file /dev/null


