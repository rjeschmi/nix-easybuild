{ system ? builtins.currentSystem }:

let
    pkgs = import <nixpkgs> { inherit system; };

    callPackage = pkgs.lib.callPackageWith (pkgs // self);

    self = {
        eb = callPackage ./eb { };
    };
    in self



