local function setup()
  local utils = require "utils"
  local lsp = require "configs.lspconfig"

  require("lspconfig").vtsls.setup {
    on_attach = function(client, bufnr)
      lsp.on_attach(client, bufnr)
    end,
    capabilities = lsp.capabilities,
    on_init = lsp.on_init,
    tsserver = {
      globalPlugins = {
        {
          name = "typescript-svelte-plugin",
          location = vim.fn.stdpath "data"
            .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
          enableForWorkspaceTypeScriptVersions = true,
        },
      },
    },
  }
end

--- @type NvPluginSpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.__setup_functions = opts.__setup_functions or {}
      table.insert(opts.__setup_functions, setup)
    end,
  },
}

-- utils.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
--   {
--     name = "typescript-svelte-plugin",
--     location = vim.fn.stdpath "data"
--       .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
--     enableForWorkspaceTypeScriptVersions = true,
--   },
-- })
