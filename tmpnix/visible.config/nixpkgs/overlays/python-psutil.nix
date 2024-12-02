self: super:

{
  python312 = super.python312.override {
    packageOverrides = pself: psuper: {
      psutil = psuper.psutil.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          ./python-psutil-tests.patch
        ];
      });
    };
  };
}
