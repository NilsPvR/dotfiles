{
  description = "Entry point for Nils' system configuation.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
  
  in
  {
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
}
