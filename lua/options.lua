require "nvchad.options"

local opt = vim.opt -- Get the options table

-- UFO FOLD SETTINGS --

-- Make folds open by default when opening a buffer
-- opt.foldlevelstart = 99
opt.foldcolumn = "0"       -- Disable native fold column

opt.cursorlineopt = 'both' -- to enable cursorline!
