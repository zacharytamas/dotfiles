{
  description = "zacharytamas' machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ 
    self, 
    nix-darwin, 
    nixpkgs, 
    nix-homebrew, 
    home-manager,
  }: 
    let 
      primaryUser = "zacharyjones";
    in
    {
      darwinConfigurations."wkt" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = { inherit inputs self primaryUser; };
        modules = [ 
          ./darwin
        ];
      };
    };
}
