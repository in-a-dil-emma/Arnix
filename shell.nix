let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) mkShellNoCC gnumake fakeroot gzip typescript sassc;
in mkShellNoCC {
  packages = [
    typescript
    fakeroot
    gnumake
    sassc
    gzip
  ];
}
