{
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  home.file = {
    ".config/nvim/" = {
      recursive = true;
      source = ../../dot_config/nvim;
    };
  };
}
