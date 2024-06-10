self: super:

{
  openexr = super.openexr.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./openexr-test-threading.patch
    ];
  });
  openexr_3 = super.openexr_3.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./openexr_3-test-threading.patch
    ];
  });
}
