return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  config = function()
    -- Define highlight group for markers BEFORE setup
    -- Link to Comment color, or use a specific fg color like { fg = "#61AFEF" }
    vim.api.nvim_set_hl(0, "UfoFoldedFg", { link = "Comment" })

    -- Call setup with ALL the desired options
    require("ufo").setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      -- >> Add these lines for indicators <<
      enable_fold_marker = true, -- Enable the markers
      signs = {
        fold_open = { text = "⌄", hl = "UfoFoldedFg" }, -- Marker for open fold
        fold_closed = { text = "▸", hl = "UfoFoldedFg" }, -- Marker for closed fold
        -- Use "+", "-" if the above symbols don't render well:
        -- fold_open = { text = "-", hl = "UfoFoldedFg" },
        -- fold_closed = { text = "+", hl = "UfoFoldedFg" },
      },
      sign_priority = 40, -- Adjust if needed for conflicts
      -- You can add other UFO options here too
    }
  end,
}
