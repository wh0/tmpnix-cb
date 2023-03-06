self: super:

{
  python310 = super.python310.override {
    packageOverrides = pself: psuper: {
      psutil = psuper.psutil.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          ./python-psutil-tests.patch
        ];
      });
    };
  };
}
