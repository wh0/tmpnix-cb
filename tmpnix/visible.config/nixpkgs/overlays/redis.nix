self: super:

{
  redis = super.redis.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./redis-tests-pgrep.patch
    ];
  });
}
