local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local lint_group = 'NvimLint'

group(lint_group, { clear = true })

cmd('BufWritePost', {
  desc = 'lints current buffer',
  group = lint_group,
  callback = function()
    local should_not_lint = vim.b.disable_lint

    if should_not_lint == nil then
      should_not_lint = vim.g.disable_lint
    end

    if should_not_lint == 1 then
      return
    end

    require('lint').try_lint()
  end,
})

local number_group = 'RelativeNumber'

group(number_group, { clear = true })

cmd('ModeChanged', {
  group = number_group,
  desc = 'dynamically set relative number',
  pattern = { '*:n', '*:v' },
  callback = function()
    vim.wo.relativenumber = true
  end,
})

cmd('ModeChanged', {
  group = number_group,
  desc = 'dynamically set relative number',
  pattern = { '*:i' },
  callback = function()
    vim.wo.relativenumber = false
  end,
})
