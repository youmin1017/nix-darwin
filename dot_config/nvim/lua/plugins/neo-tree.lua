return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem", "document_symbols" },
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        },
      },
      filesystem = {
        window = {
          mappings = {
            ["H"] = "none",
            ["z"] = "none",
            ["<BS>"] = "none",
            ["-"] = "navigate_up",
            ["I"] = "toggle_hidden",
            ["<C-w>"] = "close_all_nodes",
          },
        },
      },
      document_symbols = {
        window = {
          mappings = {
            ["l"] = "toggle_node",
          },
        },
      },
    },
  },
}
