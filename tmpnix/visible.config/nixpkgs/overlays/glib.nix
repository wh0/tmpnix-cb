self: super:

{
  glib = super.glib.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./glib-close_range-eperm.patch
    ];
  });
}
