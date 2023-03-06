mailcap ftbfs
tar cannot find /tmp/.../file
```nix
d2 = p.lib.overrideDerivation p.mailcap (attrs: { args = [ "-x" ] ++ attrs.args; })
```
fixed

```
+ curl --location --max-redirs 20 --retry 3 --disable-epsv --cookie-jar cookies --user-agent 'curl/7.83.1 Nixpkgs/22.11' --insecure -C - --fail https://releases.pagure.org/mailcap/mailcap-2.1.53.tar.xz --output /build/file
renamed="$TMPDIR/mailcap-2.1.53.tar.xz"
mv "$downloadedFile" "$renamed"
tar -xavf $downloadedFile --strip-components=1
```

https://github.com/NixOS/nixpkgs/pull/173430
