require "nvchad.mappings"

local map = vim.keymap.set

-- Custom mappings


-- Open project telescope interface
map(
  "n",
  "<leader>fp",
  "<cmd>NeovimProjectDiscover<CR>",
  { desc = "Open project telescope interface", noremap = true, silent = true }
)

-- Disable mappings

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
