derivation {
  name = "run";
  system = builtins.currentSystem;
  builder = "/bin/bash";
  args = [
    "-eux"
    "-c"
    ''
      export PATH=/usr/bin:/bin
      pwd
      false
    ''
  ];
  preferLocalBuild = true;
}
