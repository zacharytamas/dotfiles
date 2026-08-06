{ ... }: {

  home.sessionPath = [ "$HOME/.local/bin" ];
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  programs.zsh = {
    enable = true;
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