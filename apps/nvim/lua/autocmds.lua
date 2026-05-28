local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local lint_group = 'NvimLint'

group(lint_group, { clear = true })

cmd('BufWritePost', {
  desc = 'lints current buffer',
  group = lint_group,
  callback = function()
    if vim.g.disable_lint == 1 or vim.b.disable_lint == 1 then
      return
    end

    require('lint').try_lint()
  end,
})
