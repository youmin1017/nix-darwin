return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          init_options = {
            preferences = {
              importModuleSpecifierPreference = "relative",
              -- other settings
            },
          },
        },
      },
      inlay_hints = {
        exclude = {},
      },
    },
  },
}
