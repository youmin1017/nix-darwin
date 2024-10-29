---@type NvPluginSpec
local spec = {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    cmd = "Oil",
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open oil.nvim",
      },
    },
    opts = {
      delete_to_trash = true,
      keymaps = {
        ["I"] = "actions.toggle_hidden",
        ["g."] = false,
      }
    },
  },
}
return spec
