self: super:

{
  libredirect = super.libredirect.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./libredirect-test-system.patch
    ];
  });
}
