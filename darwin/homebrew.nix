{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    caskArgs.no_quarantine = true;

    taps = [
      { name = "vet-run/homebrew-vet"; trusted = true; }
      { name = "derailed/k9s"; trusted = true; }
      { name = "weknowtraining/tap"; trusted = true; }
      { name = "humanlayer/humanlayer"; trusted = true; }
      { name = "rjyo/moshi"; trusted = true; }
    ];

    brews = [
      "herdr"
      "mise"
      "mosh"
      { name = "moshi-hook"; start_service = true; }
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
