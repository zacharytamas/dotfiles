{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      { name = "vet-run/homebrew-vet"; trusted = true; }
      { name = "humanlayer/humanlayer"; trusted = true; }
      { name = "rjyo/moshi"; trusted = true; }
    ];

    brews = [
      "herdr"
      "mise"
      { name = "moshi-hook"; start_service = true; }
      "fzf"
      "zoxide"
      "dua-cli"
      "sk"
      "tree"
      "vet-run"
    ];

    casks = [
      "humanlayer"
      "1password-cli"
      "codexbar"
      "cotypist"
      "raycast"
      "google-chrome"
      "1password"
      "warp"
    ];
  };

}
