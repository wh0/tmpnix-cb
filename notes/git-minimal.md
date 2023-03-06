git-minimal
```
Test Summary Report
-------------------
t3904-stash-patch.sh                             (Wstat: 256 Tests: 8 Failed: 1)
  Failed test:  8
  Non-zero exit status: 1
t3701-add-interactive.sh                         (Wstat: 256 Tests: 70 Failed: 3)
  Failed tests:  25, 35, 58
  Non-zero exit status: 1
Files=949, Tests=24590, 2017 wallclock secs ( 9.01 usr  1.82 sys + 261.20 cusr 250.26 csys = 522.29 CPU)
Result: FAIL
make[1]: *** [Makefile:56: prove] Error 1
make[1]: Leaving directory '/tmp/nix-build-git-minimal-2.36.0.drv-0/git-2.36.0/t'
make: *** [Makefile:2949: test] Error 2
builder for '/tmp/nix/store/mq0z9sjc6w3k30vrw8y7zawca6c49yf7-git-minimal-2.36.0.drv' failed with exit code 2
```

```
nix-store -rK /tmp/nix/store/23rwbpxwv61pfjbnah0f2c8zhi9fcn3f-git-minimal-2.36.0.drv
# ctrl+c during prove
cd /tmp/nix-build-git-minimal-2.36.0.drv-0/
/tmp/nix/store/p6hwi03y04a4j70a79nay42s8ij5wxnl-bash-5.1-p16/bin/bash
. env-vars
cd git-2.36.0
cd t
./t3904-stash-patch.sh -v
```

```
expecting success of 3904.8 'stash -p with split hunk': 
	git reset --hard &&
	cat >test <<-\EOF &&
	aaa
	bbb
	ccc
	EOF
	git add test &&
	git commit -m "initial" &&
	cat >test <<-\EOF &&
	aaa
	added line 1
	bbb
	added line 2
	ccc
	EOF
	printf "%s\n" s n y q |
	git stash -p 2>error &&
	test_must_be_empty error &&
	grep "added line 1" test &&
	! grep "added line 2" test

HEAD is now at 1f3a67c second
[master 97cac8f] initial
 Author: A U Thor <author@example.com>
 1 file changed, 3 insertions(+)
 create mode 100644 test
diff --git a/test b/test
index 1802a74..515ff88 100644
--- a/test
+++ b/test
@@ -1,3 +1,5 @@
 aaa
+added line 1
 bbb
+added line 2
 ccc
(1/1) Stash this hunk [y,n,q,a,d,s,e,?]? Split into 2 hunks.
@@ -1,2 +1,3 @@
 aaa
+added line 1
 bbb
(1/2) Stash this hunk [y,n,q,a,d,j,J,g,/,e,?]? @@ -2,2 +3,3 @@
 bbb
+added line 2
 ccc
(2/2) Stash this hunk [y,n,q,a,d,K,g,/,e,?]? 
Saved working directory and index state WIP on master: 97cac8f initial
'error' is not empty, it contains:
ERROR: ld.so: object 'libc_malloc_debug.so.0' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
not ok 8 - stash -p with split hunk
#	
#		git reset --hard &&
#		cat >test <<-\EOF &&
#		aaa
#		bbb
#		ccc
#		EOF
#		git add test &&
#		git commit -m "initial" &&
#		cat >test <<-\EOF &&
#		aaa
#		added line 1
#		bbb
#		added line 2
#		ccc
#		EOF
#		printf "%s\n" s n y q |
#		git stash -p 2>error &&
#		test_must_be_empty error &&
#		grep "added line 1" test &&
#		! grep "added line 2" test
#	

# failed 1 among 8 test(s)
```

it's unhappy that there's this LD_PRELOAD thing missing
https://github.com/git/git/commit/131b94a10a77e40eb3b3ba276d07fb663e220cd1

```
TEST_NO_MALLOC_CHECK=1 ./t3701-add-interactive.sh
```
passes; other failures are the same thing

should see how this behaves on stock nix

https://github.com/NixOS/nixpkgs/issues/176999

---

since resolved
