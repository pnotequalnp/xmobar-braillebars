{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs {} }:

let
  pkg = pkgs.haskellPackages.callCabal2nix
    "xmobar-braillebars" ./. {};
in
pkg.env.overrideAttrs (
  old: with pkgs.haskellPackages; {
    nativeBuildInputs = old.nativeBuildInputs ++ [
      cabal-install
    ];
  }
)
