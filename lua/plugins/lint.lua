return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" }, -- Or other relevant events
  config = function()
    require('lint').linters_by_ft = {
      markdown = { 'markdownlint' }, -- Use 'markdownlint_cli' if that's the exact binary name
      -- Add other linters for other filetypes here
    }

    -- Autocommand to run linting on specific events
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint-autogroup", { clear = true }),
      callback = function()
        require("lint").try_lint()
      end,
    })

    print("nvim-lint configured") -- Optional debug print
  end,
}
