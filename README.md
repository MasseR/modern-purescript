# Try setting up a purescript project with nix

## Developing

Source code can be found on `src/`. Dependencies are defined on `spago.dhall`.

Dependencies are managed by `spago` and `spago2nix`. The latter creates
`spago-packages.nix` which contains the build inputs and builders (shell
scripts to compile the project).

The shell provides you with

- dhall
- dhall-lsp
- purs
- spago
- spago2nix
- node
- parcel

But notably it doesn't provide you with npm tooling.

You will end up with empty dependencies at first but invoking
`install-spago-style` will fill up your local environment with whatever is
needed by spago (coming from nix?)

You can have a live build environment either through a combination of `spago ide` + `parcel index.html` or `spago build --watch` + `parcel index.html`

- https://github.com/purescript/spago
- https://github.com/justinwoo/spago2nix
- https://github.com/justinwoo/easy-purescript-nix


### Adding new dependencies

- Modify spago.dhall
- Run `spago2nix generate`
- Run `direnv reload` (or start a new shell?)
- Run `install-spago-style` to fill your local state

## Building "production" artifact

The build is defined in the ci.nix. It uses the spago2nix generated nix packages.

``` sh
nix-build ci.nix
```
