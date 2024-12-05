the nonblocking gc test is flaky

---

```
ran test tests/functional/derivation-advanced-attributes.sh... [FAIL]
...
    ++(derivation-advanced-attributes.sh:16) nix-instantiate --store /tmp/nix-build-nix-2.24.10.drv-0/nix-test/derivation-advanced-attributes/store --pure-eval --expr 'derivation {
      name = "advanced-attributes-defaults";
      system = "my-system";
      builder = "/bin/bash";
      args = [ "-c" "echo hello > $out" ];
    }'
    warning: you did not specify '--add-root'; the result might be removed by the garbage collector
    +(derivation-advanced-attributes.sh:16) drvPath=/tmp/nix/store/zc127w17j1j9c80bj2dwl9nzpwzfixdg-advanced-attributes-defaults.drv
    ++(derivation-advanced-attributes.sh:17) basename derivation/advanced-attributes-defaults.nix .nix
    +(derivation-advanced-attributes.sh:17) testName=advanced-attributes-defaults
    +(derivation-advanced-attributes.sh:18) got=/tmp/nix-build-nix-2.24.10.drv-0/nix-test/derivation-advanced-attributes/store/tmp/nix/store/zc127w17j1j9c80bj2dwl9nzpwzfixdg-advanced-attributes-defaults.drv
    +(derivation-advanced-attributes.sh:19) expected=derivation/advanced-attributes-defaults.drv
...
    +(characterisation/framework.sh:21) diff --color=always --unified derivation/advanced-attributes-defaults.drv /tmp/nix-build-nix-2.24.10.drv-0/nix-test/derivation-advanced-attributes/store/tmp/nix/store/zc127w17j1j9c80bj2dwl9nzpwzfixdg-advanced-attributes-defaults.drv
    diff: /tmp/nix-build-nix-2.24.10.drv-0/nix-test/derivation-advanced-attributes/store/tmp/nix/store/zc127w17j1j9c80bj2dwl9nzpwzfixdg-advanced-attributes-defaults.drv: No such file or directory
    +(characterisation/framework.sh:22) echo 'FAIL: evaluation result of advanced-attributes-defaults not as expected'
    FAIL: evaluation result of advanced-attributes-defaults not as expected
    +(characterisation/framework.sh:24) badDiff=1
```

nix sets NIX_STORE in its builder env

```sh
NIX_STORE=/unusual-store nix-instantiate --store /tmp/chroot-store --pure-eval --expr 'derivation { name = "test"; builder = "/bin/false"; system = "my-system"; }'
```

stdout prints `/unusual-store/xxx-test.drv`
writes drv to `/tmp/chroot-store/nix/store/xxx-test.drv`
drv contains has out path `/unusual-store/xxx-test`
`/tmp/chroot-store/unusual-store` does not exist
