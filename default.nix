{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs {} }:

pkgs.haskellPackages.callCabal2nix "xmobar-braillebars" ./. {}
