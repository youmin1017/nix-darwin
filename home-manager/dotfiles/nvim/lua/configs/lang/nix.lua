-- local utils = require "utils"

local function setup()
  local lsp = require "configs.lspconfig"

  require("lspconfig").nil_ls.setup {
    on_attach = function(client, bufnr)
      lsp.on_attach(client, bufnr)
    end,
    capabilities = lsp.capabilities,
    on_init = lsp.on_init,
  }
end

--- @type NvPluginSpec
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        nix = { "nixfmt" },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "nil" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "nix")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.__setup_functions = opts.__setup_functions or {}
      table.insert(opts.__setup_functions, setup)
    end,
  },
}
