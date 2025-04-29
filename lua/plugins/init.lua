return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Snippets

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("snippets")
    end,
  },

  -- Comment related
  -- {
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  --   lazy = false,
  -- },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      folding = true,
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "vue",
        "typescript",
        "json",
        "sql",
        "markdown",
        "markdown_inline"
      },
    },
  },
}
