self: super:

{
  nixVersions = super.nixVersions.extend (self: super: {
    nix_2_24 = super.nix_2_24.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        ./nix-tests-unset-nix-store.patch
      ];
    });
  });
}
