
pretty sure we're getting faccessat2'd

~/tmpnix/wrapped.sh nix-instantiate -v \
  -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/82b583ba2ba2e5706b35dbe23f31362e62be2a9d.tar.gz \
  '<nixpkgs>' -A freshBootstrapTools.test

$ git rev-parse HEAD:tmpnix/visible.config/nixpkgs/overlays
f8ccea5ab858fa66268f0432af1b4c6294b139d6

/tmp/nix/store/y0y3hf18vbsrr203xhsnq5kwigjmqn13-test-bootstrap-tools.drv

---
# us forking nixpkgs:

cd /tmp
git init nixpkgs
cd nixpkgs
git remote add origin https://github.com/NixOS/nixpkgs.git
git fetch origin --depth 1 nixos-24.05
git checkout -b inspection FETCH_HEAD

git apply - <<'EOF'
diff --git a/pkgs/stdenv/linux/default.nix b/pkgs/stdenv/linux/default.nix
index e1801ab..909e9e8 100644
--- a/pkgs/stdenv/linux/default.nix
+++ b/pkgs/stdenv/linux/default.nix
@@ -93,7 +93,7 @@
     or (throw "unsupported libc for the pure Linux stdenv");
   files = archLookupTable.${localSystem.system} or (if getCompatibleTools != null then getCompatibleTools
     else (throw "unsupported platform for the pure Linux stdenv"));
-  in files
+  in (config.replaceBootstrapFiles or lib.id) files
 }:
 
 assert crossSystem == localSystem;
EOF

~/tmpnix/wrapped.sh nix-instantiate -v . --eval --show-trace -A stdenv.args 2>&1 | less

replaceBootstrapFiles accepted in 24.11
