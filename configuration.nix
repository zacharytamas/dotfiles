{ user, ... }:

{
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; 

  system.primaryUser = user;
  users.users.${user} = { home = "/Users/${user}"; };
  system.stateVersion = 6;

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      NSNavPanelExpandedStateForSaveMode = true;
      AppleICUForce24HourTime = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";
    finder.CreateDesktop = false;
    trackpad.Clicking = true;
  };

  nix-homebrew = {
    enable = true;
    user = user;
    enableRosetta = true;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    taps = [
      { name = "vet-run/homebrew-vet"; trusted = true; }
      { name = "derailed/k9s"; trusted = true; }
      { name = "weknowtraining/tap"; trusted = true; }
      { name = "humanlayer/humanlayer"; trusted = true; }
    ];
    brews = [
      "herdr"
      "mise"
      "fzf"
      "zoxide"
      "dua-cli"
      "sk"
      "tree"
      "vet-run"
      "k9s"
      "wkt"
    ];
    casks = [
      "humanlayer"
      "1password-cli"
      "codexbar"
      "font-maple-mono"
      "font-maple-mono-nf"
    ];
  };
}