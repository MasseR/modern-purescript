{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  justinwoo = callPackage ./packages.nix {};
  spago = callPackage ./spago-packages.nix {};

in

stdenv.mkDerivation {
  pname = "modern-purescript";
  version = "0.1.0.0";

  src = ./.;

  buildInputs = [
    spago.installSpagoStyle
    spago.buildSpagoStyle
  ];
  nativeBuildInputs = [
    justinwoo.purs-0_13_8
    justinwoo.spago
  ];

  unpackPhase = ''
    cp $src/spago.dhall .
    cp $src/packages.dhall .
    cp -r $src/src .
    cp -r $src/test .
    cp -r $src/index.html .

    install-spago-style
  '';

  buildPhase = ''
    mkdir dist
    build-spago-style "./src/**/*.purs"
    purs bundle "./output/**/*.js" --main Main -o dist/index.js
    cp index.html dist/
  '';

  installPhase = ''
    mkdir -p $out/share/
    mv dist/* $out/share/
  '';
}
