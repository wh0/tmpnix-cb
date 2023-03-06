```
==========================================
   elfutils 0.187: tests/test-suite.log
==========================================

# TOTAL: 232
# PASS:  223
# SKIP:  5
# XFAIL: 0
# FAIL:  4
# XPASS: 0
# ERROR: 0

.. contents:: :depth: 2

SKIP: run-large-elf-file.sh
===========================

long_bit: 64
elfclass: 64
space_available: 20
mem_needed: 6
mem_available: 
Need at least 6GB free available memory
SKIP run-large-elf-file.sh (exit status: 77)

FAIL: run-backtrace-native.sh
=============================

backtrace-child: backtrace-child.c:238: main: Assertion `l == 0' failed.
backtrace-child: backtrace-child.c:167: stdarg: Assertion `l == 0' failed.
backtrace: backtrace.c:405: exec_dump: Assertion `WIFSTOPPED (status)' failed.
./test-subr.sh: line 84: 15997 Aborted                 (core dumped) LD_LIBRARY_PATH="${built_library_path}${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH" $VALGRIND_CMD "$@"
backtrace-child: no main
FAIL run-backtrace-native.sh (exit status: 1)

FAIL: run-backtrace-data.sh
===========================

backtrace-data: backtrace-data.c:286: main: Assertion `l == 0' failed.
backtrace-data: backtrace-data.c:296: main: Assertion `WIFSTOPPED (status)' failed.
./test-subr.sh: line 84: 16016 Aborted                 (core dumped) LD_LIBRARY_PATH="${built_library_path}${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH" $VALGRIND_CMD "$@"
data: no main
FAIL run-backtrace-data.sh (exit status: 1)

FAIL: run-backtrace-dwarf.sh
============================

PTRACE_TRACEME failed: Operation not permitted
/tmp/nix-build-elfutils-0.187.drv-0/elfutils-0.187/tests/backtrace-dwarf: unexpected wait status 65280
dwarf: no main
FAIL run-backtrace-dwarf.sh (exit status: 1)

SKIP: run-backtrace-native-biarch.sh
====================================

biarch testing disabled
SKIP run-backtrace-native-biarch.sh (exit status: 77)

SKIP: run-backtrace-native-core.sh
==================================

./backtrace-subr.sh: line 151: flock: command not found
SKIP run-backtrace-native-core.sh (exit status: 77)

SKIP: run-backtrace-native-core-biarch.sh
=========================================

biarch testing disabled
SKIP run-backtrace-native-core-biarch.sh (exit status: 77)

FAIL: run-deleted.sh
====================

PID 16586 - process
TID 16586:
/tmp/nix-build-elfutils-0.187.drv-0/elfutils-0.187/src/stack: dwfl_thread_getframes tid 16586: Operation not permitted
/tmp/nix-build-elfutils-0.187.drv-0/elfutils-0.187/src/stack: Couldn't show any frames.
FAIL run-deleted.sh (exit status: 1)

SKIP: run-lfs-symbols.sh
========================

LFS testing is irrelevant on this system
SKIP run-lfs-symbols.sh (exit status: 77)

============================================================================
Testsuite summary for elfutils 0.187
============================================================================
# TOTAL: 232
# PASS:  223
# SKIP:  5
# XFAIL: 0
# FAIL:  4
# XPASS: 0
# ERROR: 0
============================================================================
See tests/test-suite.log
Please report to https://sourceware.org/bugzilla
============================================================================
make[3]: *** [Makefile:2577: test-suite.log] Error 1
make[2]: *** [Makefile:2685: check-TESTS] Error 2
make[1]: *** [Makefile:4551: check-am] Error 2
make: *** [Makefile:532: check-recursive] Error 1
error: builder for '/tmp/nix/store/dinvwvdfmlladxhanbfrpz21cxpbrw13-elfutils-0.187.drv' failed with exit code 2
error: 1 dependencies of derivation '/tmp/nix/store/46fgnab24a8850li0q2skmjdzz7nf3r3-systemd-250.4.drv' failed to build
error: 1 dependencies of derivation '/tmp/nix/store/lx4x8564v98r3s5r5rr9zqv3y5qi2jws-emacs-nox-28.1.drv' failed to build

```

---

looks like ptrace stuff is failing. need to disable these tests
