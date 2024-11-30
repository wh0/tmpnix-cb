{
  replaceBootstrapFiles =
    prevFiles:
    let
      replacements = {
        "sha256-YQlr088HPoVWBU2jpPhpIMyOyoEDZYDw1y60SGGbUM0=" = import <nix/fetchurl.nix> {
          url = "https://cdn.glitch.me/5a9fc653-d4ea-4f87-b41f-2015392bbd4a/bootstrap-202405a%2Fbootstrap-tools.tar.xz?v=1717647991795";
          hash = "sha256-RQOM6LlxTJ6Ku90HO6Tn8Io/8WF5WAmaWx9GieIjr3U=";
          name = "bootstrap-tools.tar.xz";
        };
        "sha256-QrTEnQTBM1Y/qV9odq8irZkQSD9uOMbs2Q5NgCvKCNQ=" = import <nix/fetchurl.nix> {
          url = "https://cdn.glitch.global/5a9fc653-d4ea-4f87-b41f-2015392bbd4a/bootstrap-202405a%2Fbusybox?v=1717647953418";
          hash = "sha256-MmKdaDb9aSmEkxD7KrxYuh5xv6PSWrZURHlLE6cyqm4=";
          executable = true;
          name = "busybox";
        };
      };
    in
    builtins.mapAttrs (name: prev: replacements.${prev.outputHash} or prev) prevFiles;
}
