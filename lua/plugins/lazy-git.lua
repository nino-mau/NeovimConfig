return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
  },
  -- Temporarily comment out lazygit-message and everything else
  -- {
  --   "isak102/lazygit-message.nvim",
  --   dependencies = { "kdheepak/lazygit.nvim" },
  -- },
}
