self: super:

{
  openssh = super.openssh.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./openssh-pty-eperm.patch
      ./openssh-regress-grep.patch
    ];
    preCheck = old.preCheck + ''
      substituteInPlace regress/*.sh \
        --replace-quiet '/bin/sh' '${self.stdenv.shell}'
    '';
  });
}
