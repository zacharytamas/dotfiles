{ primaryUser, ... }:
{
  homebrew.taps = [
    { name = "derailed/k9s"; trusted = true; }
  ];
  homebrew.brews = [ "k9s" ];
}