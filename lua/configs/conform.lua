local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    -- Web Development (Add these)
    javascript = { "prettierd", "prettier" }, -- Try prettierd first, fallback to prettier
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    vue = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },

    -- Existing ones (Keep or modify as needed)
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" }, -- Add if you use SCSS
    less = { "prettierd", "prettier" }, -- Add if you use Less
    html = { "prettierd", "prettier" },

    -- Add other filetypes and their formatters here
    -- python = { "isort", "black" },
    -- ["*"] = { "codespell" }, -- Example: run codespell on all files

  },

  linters_by_ft = {
    markdown = { "markdownlint" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
