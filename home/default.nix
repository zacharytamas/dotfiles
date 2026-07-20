{ config, primaryUser, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";

  links = [
    { src = ".config/herdr/config.toml"; dest = ".config/herdr/config.toml"; }
    { src = ".config/herdr/plugins/config"; dest = ".config/herdr/plugins/config"; }
    { src = ".omp/agent/config.yml"; dest = ".omp/agent/config.yml"; }
    { src = ".agents"; dest = ".agents"; }
    { src = "dot-no-mistakes/config.yaml"; dest = ".no-mistakes/config.yaml"; }
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
  };

  home.file = lib.listToAttrs (map ({ src, dest }: {
    name = dest;
    value.source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/${src}";
  }) links);
}