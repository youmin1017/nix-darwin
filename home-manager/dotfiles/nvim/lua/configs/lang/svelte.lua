local function setup()
  local utils = require "utils"
  local lsp = require "configs.lspconfig"

  require("lspconfig").svelte.setup {
    on_attach = function(client, bufnr)
      lsp.on_attach(client, bufnr)
      vim.keymap.set(
        "n",
        "<leader>co",
        utils.lsp.action["source.organizeImports"],
        { buffer = bufnr, desc = "Organize Imports" }
      )
    end,
    capabilities = lsp.capabilities,
    on_init = lsp.on_init,
  }
end

--- @type NvPluginSpec
return {
  {
    "conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.svelte = { "prettier" }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "prettier" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      table.insert(opts.ensure_installed, { "svelte", "typescript", "javascript" })
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
