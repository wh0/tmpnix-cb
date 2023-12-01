self: super:

{
  python311 = super.python311.override {
    packageOverrides = pself: psuper: {
      psutil = psuper.psutil.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          ./python-psutil-tests.patch
        ];
      });
    };
  };
}
