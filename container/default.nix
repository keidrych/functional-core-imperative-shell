{ nodejs ? pkgs.nodejs-8_x, pkgs ? import <nixpkgs> {} }:
let
    lib = import ../nix-node-packages {
      inherit pkgs nodejs;
    };
    in lib.callPackage ../project.nix {}
