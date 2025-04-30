---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "github_dark_custom",

  hl_override = {
    -- ["@tag"] = { fg = "#57ab5a" },
  },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
