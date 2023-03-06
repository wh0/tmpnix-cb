self: super:

{
  elfutils = super.elfutils.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./elfutils-tests-ptrace.patch
    ];
  });
}
