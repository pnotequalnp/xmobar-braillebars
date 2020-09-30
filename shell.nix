{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs {} }:

let
  pkg = import ./default.nix { inherit sources pkgs; };
in
pkg.env.overrideAttrs (
  old: with pkgs.haskellPackages; {
    nativeBuildInputs = old.nativeBuildInputs ++ [
      cabal-install
    ];
  }
)
