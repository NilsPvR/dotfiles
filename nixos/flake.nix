{
  description = "Entry point for Nils' system configuation.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { flake-parts, nixpkgs, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } ({ config, withSytem, moduleWithSystem, ... } @ top: {
      imports = [
        # Use external flake logic
      ];
      flake = {
        # Normale flake attributes
        nixosConfigurations = {
          # This should correspond to the hostname
          nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./configuration.nix
            ];
          };
        };
      };
      systems = [
        # Systems for which to build `perSystem` attribute
        "x86_64-linux"
      ];
      perSystem = { pkgs, ...}: {
        
      };
    });
}
