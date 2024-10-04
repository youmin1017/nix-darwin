return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<C-s>"] = require("cmp").mapping.complete(),
      },
    },
  },
}
