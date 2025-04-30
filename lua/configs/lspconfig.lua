require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("volar", {
  -- add filetypes for typescript, javascript and vue
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = true,
    },
  },
})

vim.lsp.config("stylelint_lsp", {
  settings = {
  }
})

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

local servers = { "html", "cssls", "volar", "ts_ls", "eslint", "jsonls", "sqlls", "css_variables", "stylelint-lsp",
  "tailwindcss" }
vim.lsp.enable(servers)
