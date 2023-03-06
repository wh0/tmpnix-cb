self: super:

{
  glibc = super.glibc.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      (self.fetchurl {
        url = "https://src.fedoraproject.org/rpms/glibc/raw/98f35706db9bcb0bd505b3228514cf8ecebe9af2/f/glibc-rhbz1869030-faccessat2-eperm.patch";
        sha256 = "0hcqi4j3f897hf1xzqpah6d2xdz7kn7dbbmsbrrk79iliq8qxrgd";
      })
      ./glibc-clone3-eperm.patch
    ];
  });
}
