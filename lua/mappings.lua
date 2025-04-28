require "nvchad.mappings"

local nomap = vim.keymap.del
local map = vim.keymap.set

-- Custom mappings

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Open project telescope interface
map(
  "n",
  "<leader>fp",
  "<cmd>NeovimProjectDiscover<CR>",
  { desc = "Open project telescope interface", noremap = true, silent = true }
)

-- Disable mappings

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
