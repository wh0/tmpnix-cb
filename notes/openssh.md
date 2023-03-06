```
cd ./regress || exit $?; \
EGREP='/tmp/nix/store/1fln1xcad8kmwiv1mks1zrn44hkaazym-gnugrep-3.7/bin/grep -E' \
make \
        .CURDIR="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress" \
        .OBJDIR="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress" \
        BUILDDIR="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1" \
        OBJ="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress" \
        PATH="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1:${PATH}" \
        TEST_ENV=MALLOC_OPTIONS="" \
        TEST_MALLOC_OPTIONS="" \
        TEST_SSH_SCP="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/scp" \
        TEST_SSH_SSH="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh" \
        TEST_SSH_SSHD="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/sshd" \
        TEST_SSH_SSHAGENT="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-agent" \
        TEST_SSH_SSHADD="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-add" \
        TEST_SSH_SSHKEYGEN="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-keygen" \
        TEST_SSH_SSHPKCS11HELPER="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-pkcs11-helper" \
        TEST_SSH_SSHKEYSCAN="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-keyscan" \
        TEST_SSH_SFTP="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/sftp" \
        TEST_SSH_PKCS11_HELPER="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-pkcs11-helper" \
        TEST_SSH_SK_HELPER="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/ssh-sk-helper" \
        TEST_SSH_SFTPSERVER="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/sftp-server" \
        TEST_SSH_MODULI_FILE="/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/moduli" \
        TEST_SSH_PLINK="plink" \
        TEST_SSH_PUTTYGEN="puttygen" \
        TEST_SSH_CONCH="conch" \
        TEST_SSH_IPV6="yes" \
        TEST_SSH_UTF8="no" \
        TEST_SHELL="sh" \
        EXEEXT="" \
        t-exec && echo all t-exec passed
make[1]: Entering directory '/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress'
run test connect.sh ...
/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress/test-exec.sh: line 319: which: command not found

WARNING: Unsafe (group or world writable) directory permissions found:
 /tmp

These could be abused to locally escalate privileges.  If you are
sure that this is not a risk (eg there are no other users), you can
bypass this check by setting TEST_SSH_UNSAFE_PERMISSIONS=1

/bin/sh: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0/lib/libredirect.so)
/bin/sh: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by /tmp/nix/store/pfz2z9zp6mrh1pf7g77bp0fwj6sdg7pb-libredirect-0/lib/libredirect.so)
chmod: cannot access '/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress/authorized_keys_app': No such file or directory
sshd: no hostkeys available -- exiting.
FATAL: sshd_proxy broken
make[1]: *** [Makefile:221: t-exec] Error 1
make[1]: Leaving directory '/tmp/nix-build-openssh-9.0p1.drv-0/openssh-9.0p1/regress'
make: *** [Makefile:725: t-exec] Error 2
error: builder for '/tmp/nix/store/mi4lynpqknjic79w2nss8ngfhmc10cf7-openssh-9.0p1.drv' failed with exit code 2
```

btw https://nixos.org/manual/nixos/stable/release-notes.html#sec-release-22.05-incompatibilities
git no longer has a dependency on openssh, so uh

it's still a build dependency somewhere, dunno

---

patched to give up chown-ing pty on EPERM if things are sane enough
various edits to tests to avoid /bin/sh, because host /bin/sh is incompatible with libredirect
- egrep/fgrep uses /bin/sh shebang
- scripts generated during t-exec had /bin/sh shebang
