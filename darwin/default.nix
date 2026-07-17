{ pkgs, inputs, self, primaryUser, ... }:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix = {
    enable = false;
  };

  nix-homebrew = {
    user = primaryUser;
    enable = true;
    autoMigrate = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.lilex
    nerd-fonts.martian-mono
    maple-mono.NF
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${primaryUser} = {
      imports = [
        ../home
      ];
    };
    extraSpecialArgs = { inherit inputs self primaryUser; };
  };

  system.primaryUser = primaryUser;
  users.users.${primaryUser} = { 
    home = "/Users/${primaryUser}"; 
    shell = pkgs.zsh;
  };
}