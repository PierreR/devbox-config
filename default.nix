# You can build this repository by running:
#   $ nix-build
with import <nixpkgs> {};

let

# Instead of building from nixpkgs, use the provided static executable.
# By relying solely on the static executable, we don't care about the nix machinery that would build from source.
# (chances are that the version we want is not yet in the binary cache).
# For instance, building with nix using `nix-env -iA haskellPackages.dhall_1_20_1 -f https://github.com/NixOS/nixpkgs/archive/088cb13aee074fb48d104222cb80fb552ec17529.tar.gz `
# would currently 250M (unpacked) and then compile dhall ...
dhall =
  stdenv.mkDerivation rec {
    name = "dhall-${version}";
    version = "1.20.1";
    src = fetchurl {
        url = "https://github.com/dhall-lang/dhall-haskell/releases/download/1.20.1/dhall-${version}-x86_64-linux.tar.bz2";
        sha256 = "1ycb0pglwi9k1pn4qqjyvd4bi54000fb9aqxnn550a515rm6cb03";
    };

    installPhase = ''
      mkdir -p $out/bin
      cp dhall $out/bin/
    '';
  };
in
{
inherit dhall;
}
