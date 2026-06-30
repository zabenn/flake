{
  description = "Sam's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    affinity-nix = {
      url = "path:/home/sam/affinity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      affinity-nix,
      nix-flatpak,
      nix-index-database,
      nix-vscode-extensions,
      nur,
      ...
    }:
    let
      inherit (self) outputs;
      mkSystem =
        hostname: config:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            { networking.hostName = hostname; }
            ./hardware/${hostname}.nix
            ./nixos/${config}.nix
          ];
        };
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;

      nixosConfigurations = {
        p16s = mkSystem "p16s" "raise";
        xps = mkSystem "xps" "raise";
        zbox = mkSystem "zbox" "raise";
      };
    };
}
