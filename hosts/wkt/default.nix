{ primaryUser, ... }:
{
  homebrew.taps = [
    { name = "weknowtraining/tap"; trusted = true; }
    { name = "derailed/k9s"; trusted = true; }
  ];
  homebrew.brews = [ "wkt" "k9s" ];
}