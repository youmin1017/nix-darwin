{ ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  home.file = {
    ".config/nvim/" = {
      recursive = true;
      source = ../dotfiles/nvim;
    };
  };
}
