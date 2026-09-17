{ ... }: {

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  programs.zsh = {
    enable = true;
    envExtra = ''
      typeset -U path PATH
      path=("$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.bun/bin" "$HOME/.opencode/bin" "$HOME/Library/pnpm/bin" $path)
    '';
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons=always --hyperlink";
      flush_dns = "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder";
    };
  };

  programs.starship = {
    enable = true;
  };
}