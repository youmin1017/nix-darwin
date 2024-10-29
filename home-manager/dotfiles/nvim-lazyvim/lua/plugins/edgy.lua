return {
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.keys = {
        -- increase width
        ["<A-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<A-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<A-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<A-Down>"] = function(win)
          win:resize("height", -2)
        end,
      }
    end,
  },
}
