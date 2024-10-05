-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local nomap = vim.keymap.del

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                  Disable Mappings                                 │
--     ╰───────────────────────────────────────────────────────────────────╯
nomap("n", "<leader>ft")
nomap("n", "<leader>fT")
nomap("t", "<C-/>")
nomap("t", "<esc><esc>")
nomap("t", "<C-h>")
-- nomap("t", "<C-j>")
-- nomap("t", "<C-k>")
nomap("t", "<C-l>")

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                  Convenience Mappings                             │
--     ╰───────────────────────────────────────────────────────────────────╯
map("n", ";", ":", { desc = "CMD enter command mode" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                  Editor                                           │
--     ╰───────────────────────────────────────────────────────────────────╯
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })
map("n", ">", ">>", { nowait = true, desc = "Editor Indent forward easily" })
map("n", "<", "<<", { nowait = true, desc = "Editor Indent backword easily" })
map("x", ">", ">gv", { nowait = true, desc = "Editor Indent forward easily" })
map("x", "<", "<gv", { nowait = true, desc = "Editor Indent backword easily" })
map("i", "<C-a>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-d>", "<Del>", { desc = "delete character" })
map({ "n", "v" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                  Clipboard: Normal/Visual mode                    │
--     ╰───────────────────────────────────────────────────────────────────╯
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Editor Yank to system clipboard" })
map({ "n", "x" }, "<leader>Y", '"+yy', { desc = "Editor Yank line to system clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Editor Paste from system clipboard" })
map({ "n", "x" }, "<leader>P", '"+P', { desc = "Editor Paste from system clipboard before cursor" })
map({ "n", "x" }, "<leader>d", '"+d', { desc = "Editor Delete to system clipboard" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                  Cursor Movement                                  │
--     ╰───────────────────────────────────────────────────────────────────╯
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
-- map({ "n", "x" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Editor Move down", expr = true })
-- map({ "n", "x" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Editor Move down", expr = true })
map({ "n", "x" }, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Editor Move down", expr = true })
map({ "n", "x" }, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Editor Move down", expr = true })
map({ "n", "x" }, "gh", "g0", { desc = "Editor Go to begging" })
map({ "n", "x" }, "gl", "g$", { desc = "Editor Go to end of line" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                   Terminal                                        │
--     ╰───────────────────────────────────────────────────────────────────╯
map("t", "<C-x>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root(), count = 3 })
end
map("n", "<M-h>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<M-i>", function()
  LazyVim.terminal.open(
    "zsh",
    { cwd = LazyVim.root(), border = "single", size = {
      width = 0.8,
      height = 0.7,
    }, count = 3 }
  )
end, { desc = "Terminal float (Root Dir)" })
map("n", "<M-S-i>", function()
  LazyVim.terminal("zsh", { border = "single", size = {
    width = 0.8,
    height = 0.7,
  } })
end, { desc = "Terminal float (root)" })
map("t", "<M-i>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<M-h>", "<cmd>close<cr>", { desc = "Hide Terminal" })
