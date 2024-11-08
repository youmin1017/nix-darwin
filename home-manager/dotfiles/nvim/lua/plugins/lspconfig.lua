---@type NvPluginSpec
return {
  { import = "configs.lang.lua" },
  { import = "configs.lang.svelte" },
  { import = "configs.lang.vtsls" },
  { import = "configs.lang.nix" },
  { import = "configs.lang.rust" },
  { import = "configs.lang.docker" },
  { import = "configs.lang.sql" },
  { import = "configs.lang.go" },
  { import = "configs.lang.json" },

  {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
      for _, setup in ipairs(opts.__setup_functions) do
        setup()
      end
    end,
  },
}
