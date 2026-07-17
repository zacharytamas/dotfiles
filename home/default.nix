{ config, primaryUser, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";

  links = [
    { src = ".config/herdr/config.toml"; dest = ".config/herdr/config.toml"; }
    { src = ".omp/agent/config.yml"; dest = ".omp/agent/config.yml"; }
    # Share AGENTS.md across different harnesses
    { src = "AGENTS.md"; dest = ".claude/CLAUDE.md"; }
    { src = "AGENTS.md"; dest = ".codex/AGENTS.md"; }
    { src = "AGENTS.md"; dest = ".config/opencode/AGENTS.md"; }
  ];
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

  home.file = lib.listToAttrs (map ({ src, dest }: {
    name = dest;
    value.source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/${src}";
  }) links);
}