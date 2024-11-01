{
  pkgs,
  system,
  ...
}:
{
  # home.packages = with pkgs; [
  #   zsh-autosuggestions
  # ];
  programs.zsh = {
    enable = true;
    initExtraBeforeCompInit = ''
      function zvm_config() {
        ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
        ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
        ZVM_KEYTIMEOUT=0.03
      }

      function zvm_after_init() {
        eval "$(fzf --zsh)"
      }
    '';
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    antidote = {
      enable = true;
      plugins = [
        "Aloxaf/fzf-tab"
        "jeffreytse/zsh-vi-mode"
        "paulirish/git-open"
      ];
    };
  };

  home.shellAliases =
    let
      isDarwin = system == "aarch64-darwin";
    in
    {
      k = "kubectl";
      ii = "open -a Finder.app";
      cz = "chezmoi";
      rm = if isDarwin then "trash" else "rm";
      ssh = "kitten ssh";
      lg = "lazygit";

      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
}
