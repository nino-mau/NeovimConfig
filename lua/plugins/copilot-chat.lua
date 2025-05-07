return {
  "CopilotC-Nvim/CopilotChat.nvim",
  cmd = { "CopilotChat", "CopilotChatOpen" },
  keys = {
    { "<leader>cc", "<cmd>CopilotChatOpen<CR>", desc = "Copilot Chat" },
  },
  dependencies = {
    "zbirenbaum/copilot.lua", -- core engine :contentReference[oaicite:0]{index=0}
    "nvim-lua/plenary.nvim",  -- required utilities :contentReference[oaicite:1]{index=1}
  },
  build = "make tiktoken",    -- installs tiktoken bindings :contentReference[oaicite:2]{index=2}
  opts = {},                  -- ensure opts is always a table
  config = function(_, opts)
    -- Note: module name is "CopilotChat", not "copilot_chat"
    require("CopilotChat").setup(opts)
  end,
}
