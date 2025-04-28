return {
  {
    "mg979/vim-visual-multi",
    branch = "master",

    init = function()
      -- Use vim.g directly inside init
      vim.g.VM_maps = {
        ["Find Under"] = "<C-b>", -- Change C-n to C-d
        -- ["Find Subword Under"] = "<C-l>", -- Change C-n to C-d
      }

      vim.g.VM_custom_remaps = {
        ["Find Under"] = "<C-b>", -- Change C-n to C-d
        -- ["Find Subword Under"] = "<C-l>", -- Change C-n to C-d
      }
    end,

    event = "VeryLazy",
  },
}
