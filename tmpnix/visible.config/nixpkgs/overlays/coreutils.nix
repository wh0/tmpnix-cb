self: super:

{
  coreutils = super.coreutils.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./coreutils-tests-acl.patch
    ];
  });
}
