{ config, pkgs, user, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";

  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      bindkey '^f' autosuggest-accept
    '';
    shellAliases = {
      ls = "eza --icons=always --hyperlink";
      flush_dns = "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder";
    };
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      settings = {
        minimum_release_age = "1d";
      };
      tools = {
        "aqua:ajeetdsouza/zoxide" = "latest";
        "aqua:anomalyco/opencode" = "latest";
        "aqua:ast-grep/ast-grep" = "latest";
        "aqua:astral-sh/uv" = "latest";
        "aqua:BurntSushi/ripgrep" = "latest";
        "aqua:cli/cli" = "latest";
        "aqua:direnv/direnv" = "latest";
        "aqua:jesseduffield/lazydocker" = "latest";
        "aqua:jesseduffield/lazygit" = "latest";
        "aqua:junegunn/fzf" = "latest";
        "aqua:koalaman/shellcheck" = "latest";
        "aqua:max-sixty/worktrunk" = "latest";
        "aqua:neovim/neovim" = "latest";
        "aqua:openai/codex" = "latest";
        "aqua:sharkdp/bat" = "latest";
        "aqua:sharkdp/fd" = "latest";
        "biome" = "latest";
        "bun" = "latest";
        "eza" = "latest";
        "ffmpeg" = "latest";
        "github:fallow-rs/fallow" = "latest";
        "github:modem-dev/hunk" = "latest";
        "go" = "latest";
        "node" = "latest";
        "pnpm" = "latest";
        "python" = "3.14";
        "sqlite" = "latest";
        "yarn" = "1.22.22";
      };
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