```
[314/1203] Linking target glib/tests/testing-helper
[315/1203] Generating glib/tests/tmpsample.xml with a custom command
FAILED: glib/tests/tmpsample.xml 
/tmp/nix-build-glib-2.72.2.drv-0/glib-2.72.2/build/glib/gtester -k --quiet --i-know-this-is-deprecated -o glib/tests/tmpsample.xml --test-arg=--gtester-selftest /tmp/nix-build-glib-2.72.2.drv-0/glib-2.72.2/build/glib/gtester

** (/tmp/nix-build-glib-2.72.2.drv-0/glib-2.72.2/build/glib/gtester:16380): WARNING **: 02:11:36.692: Failed to execute test binary: /tmp/nix-build-glib-2.72.2.drv-0/glib-2.72.2/build/glib/gtester: Failed to close file descriptor for child process (Operation not permitted)
ninja: build stopped: subcommand failed.
error: builder for '/tmp/nix/store/akrf00idnfzmbrhk3w7qyiydp6xxss6q-glib-2.72.2.drv' failed with exit code 1
```

https://sources.debian.org/src/glib2.0/2.72.2-2/glib/gspawn.c/?hl=2575#L1599

https://github.com/containers/podman/issues/10337
