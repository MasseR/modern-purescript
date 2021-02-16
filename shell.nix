with (import <nixpkgs> {});

let
  packages = callPackage ./packages.nix {};
  spagopkgs = callPackage ./spago-packages.nix {};

in
mkShell {
  buildInputs = [
    packages.purs-0_13_8
    packages.spago
    packages.spago2nix

    packages.dhall-simple
    packages.dhall-lsp-simple

    spagopkgs.installSpagoStyle
    spagopkgs.buildFromNixStore
    spagopkgs.buildSpagoStyle

    nodejs
    pkgs.nodePackages.parcel-bundler

    (python3.withPackages (_: []))
  ];
}
