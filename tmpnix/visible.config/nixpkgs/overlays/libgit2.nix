self: super:

{
  libgit2 = super.libgit2.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./libgit2-tests-threadmania.patch
    ];
  });
}
