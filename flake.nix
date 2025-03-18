{
  description = "Ben's NixOS flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.follows = "nixos-cosmic/nixpkgs-stable";
    #nixpkgs.follows = "nixos-cosmic/nixpkgs";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      #url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      #url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	nvf = {
		url = "github:notashelf/nvf";
		inputs.nixpkgs.follows = "nixpkgs";
	};

    nixos-cosmic = {
    	url = "github:lilyinstarlight/nixos-cosmic";
	#inputs.nixpkgs.follows = "nixpkgs";
    };

	textfox = {
		url = "github:adriankarlen/textfox";
		inputs.nixpkgs.follows = "nixpkgs";
	};

    #stylix = {
    #  url = "github:danth/stylix/release-24.11";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
      specialArgs = {
        inherit inputs;
      };

      modules = [
      {
       nix = {
        settings = {
            substituters = [
              "https://cosmic.cachix.org"
            ];
            trusted-public-keys = [
              "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
            ];
          };
        };
      }
      inputs.nixos-cosmic.nixosModules.default
      ./hosts/default/configuration.nix
      home-manager.nixosModules.home-manager
      #inputs.stylix.nixosModules.stylix
      inputs.lanzaboote.nixosModules.lanzaboote
      ];
    };
  };
  };
}
