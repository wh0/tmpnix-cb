self: super:

{
  nodejs_22 = super.nodejs_22.override {
    callPackage = p: args: self.callPackage p (args // {
      stdenv = self.ccacheStdenv;
      buildPackages = self.buildPackages // {
        stdenv = self.buildPackages.ccacheStdenv; 
      };
    });
  };
}
