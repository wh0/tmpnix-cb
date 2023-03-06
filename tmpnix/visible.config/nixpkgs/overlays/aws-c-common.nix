self: super:

{
  aws-c-common = super.aws-c-common.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./aws-c-common-tests-affinity.patch
    ];
  });
}
