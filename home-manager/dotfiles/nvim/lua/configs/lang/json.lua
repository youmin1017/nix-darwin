local function setup()
  local lsp = require "configs.lspconfig"

  require("lspconfig").jsonls.setup {
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
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.__setup_functions = opts.__setup_functions or {}
      table.insert(opts.__setup_functions, setup)
      -- opts.servers.settings = opts.servers.settings or {}
      -- opts.servers.settings.jsonls = opts.servers.settings.jsonls or {}
      --
      -- opts.servers.settings.jsonls = {
      --   -- lazy-load schemastore when needed
      --   on_new_config = function(new_config)
      --     new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      --     vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
      --   end,
      --   settings = {
      --     json = {
      --       format = {
      --         enable = true,
      --       },
      --       validate = { enable = true },
      --     },
      --   },
      -- }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
    },
  },

  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "json-lsp" } },
  },
}
