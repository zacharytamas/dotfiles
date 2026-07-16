{ config, primaryUser, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  imports = [
    ./shell.nix
    ./mise.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      XDG_CONFIG_HOME = "$HOME/.config";
    };
  };

  home.file.".config/herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr/config.toml";

  # Share my AGENTS.md file across different harnesses
  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".codex/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".config/opencode/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
}