{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.image = nixpkgs.legacyPackages.x86_64-linux.callPackage ./src/image/default.nix { };
    packages.x86_64-linux.installer = nixpkgs.legacyPackages.x86_64-linux.callPackage ./src/installer/default.nix { };
  };
}
