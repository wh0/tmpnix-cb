source is busted

curl https://cache.nixos.org/nar/0lryqird28gasafqf522kss4z4shn3w5lk37ppdzdcfj6h70rrbm.nar.xz | xz -d | ~/tmpnix/wrapped.sh nix-store --restore /tmp/source && ~/tmpnix/wrapped.sh nix-store --add /tmp/source
