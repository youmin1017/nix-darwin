return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "prettier" } },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      local supported = {
        javascript = "js",
        typescript = "ts",
        javascriptreact = "jsx",
        typescriptreact = "tsx",
        markdown = "md",
        json = "json",
        jsonc = "jsonc",
        css = "css",
        html = "html",
        yaml = "yaml",
        scss = "scss",
        less = "less",
        svelte = "svelte",
        vue = "vue",
      }

      opts.formatters.deno_fmt = {
        args = function(self, ctx)
          return {
            "fmt",
            "-",
            "--unstable-component",
            "--ext",
            supported[vim.bo[ctx.buf].filetype],
          }
        end,
      }

      for ft, _ in pairs(supported) do
        opts.formatters_by_ft[ft] = { "deno_fmt" }
      end

      opts.formatters_by_ft.svelte = { "prettier" }
    end,
  },
}
