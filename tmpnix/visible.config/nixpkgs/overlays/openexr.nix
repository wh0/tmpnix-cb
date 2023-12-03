self: super:

{
  openexr = super.openexr.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./openexr-test-threading.patch
    ];
  });
}
