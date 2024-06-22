self: super:

{
  ccacheWrapper = super.ccacheWrapper.override {
    extraConfig = ''
      . /app/tmpnix/ccache-wrapper-extra-config.sh
    '';
  };
}
