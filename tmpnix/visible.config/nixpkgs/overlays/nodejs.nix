self: super:

{
  nodejs_18 = super.nodejs_18.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./nodejs-test-pids.patch
    ];
  });
  nodejs_20 = super.nodejs_20.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./nodejs-test-pids.patch
    ];
  });
  nodejs_22 = super.nodejs_22.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./nodejs-test-pids.patch
    ];
  });
}
