self: super:

{
  libuv = super.libuv.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./libuv-test-affinity.patch
    ];
  });
}
