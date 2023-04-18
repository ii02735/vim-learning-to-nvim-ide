-- configuration for nvim-lint

local lint = require('lint')

-- apply linters by filetype

lint.linters_by_ft = {
    php = { 'psalm' }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      lint.try_lint()
    end,
  })