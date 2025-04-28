require "nvchad.options"

local opt = vim.opt -- Get the options table

-- UFO FOLD SETTINGS --

-- Make folds open by default when opening a buffer
opt.foldlevelstart = 99
opt.foldcolumn = "auto" -- Disable native fold column

opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]] -- Add fold indicators
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
