{
  description = "Home Manager configuration of src";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.home-manager.follows = "home-manager";
      };
  };
  outputs =
    { nixpkgs, home-manager, zen-browser, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."src" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {inherit zen-browser;};
      };
    };
}
