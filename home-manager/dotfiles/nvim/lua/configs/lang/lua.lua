local function setup()
  local mylsp = require "configs.lspconfig"

  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()

  require("lspconfig").lua_ls.setup {
    on_attach = mylsp.on_attach,
    capabilities = mylsp.capabilities,
    on_init = mylsp.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

--- @type NvPluginSpec
return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "stylua" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.__setup_functions = opts.__setup_functions or {}
      table.insert(opts.__setup_functions, setup)
    end,
  },
}
