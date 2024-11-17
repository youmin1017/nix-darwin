local function setup()
  local lsp = require "configs.lspconfig"

  require("lspconfig").yamlls.setup {
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        schemas = require("schemastore").yaml.schemas(),
        validate = { enable = true },
      },
    },
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
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },

  {
    "williamboman/mason-lspconfig",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "yamlls" })
    end,
  },

  {
    "williamboman/mason-lspconfig",
    opts = {
      handlers = {
        ["yamlls"] = setup,
      },
    },
  },
}
