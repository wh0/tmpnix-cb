self: super:

{
  nixVersions = super.nixVersions.extend (self: super: {
    nix_2_18 = super.nix_2_18.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        ./nix-tests-sandbox.patch
      ];
    });
  });
}
