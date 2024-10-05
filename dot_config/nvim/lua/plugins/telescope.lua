return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
      { "<leader>fw", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    },
  },
}
