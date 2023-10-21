{
  description = "Ben's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, ... }@inputs: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in
  {
  nixosConfigurations = {
    NixOSBen = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };

      modules = [
      nur.nixosModules.nur
      ./configuration.nix
      ];
    };
  };
  };
}
