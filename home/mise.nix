{ ... }:
{
  programs.mise = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      auto_install = true;
    };

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
        "github:can1357/oh-my-pi" = "latest";
        "github:fallow-rs/fallow" = "latest";
        "github:modem-dev/hunk" = "latest";
        "go" = "latest";
        "node" = "latest";
        "pnpm" = "latest";
        "python" = "3.14";
        "sqlite" = "latest";
        "yarn" = "1.22.22";
        "yq" = "latest";
      };
    };
  };
}