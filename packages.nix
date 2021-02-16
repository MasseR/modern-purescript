{ pkgs, fetchFromGitHub }:

with builtins;

let
  easy-ps = fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    inherit (fromJSON (readFile ./easy-purescript-nix.json)) sha256 rev;
  };
  spago2nix = fetchFromGitHub {
    owner = "justinwoo";
    repo = "spago2nix";
    inherit (fromJSON (readFile ./spago2nix.json)) sha256 rev;
  };
  easy-dhall-nix = fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-dhall-nix";
    inherit (fromJSON (readFile ./easy-dhall-nix.json)) sha256 rev;
  };

in

{
  inherit (pkgs.callPackage easy-ps {}) purs-0_13_8 spago;
  inherit (pkgs.callPackage easy-dhall-nix {}) dhall-simple dhall-lsp-simple;
  spago2nix = pkgs.callPackage spago2nix {};
}
