local cmd = vim.api.nvim_create_user_command

cmd('NoLint', function(opts)
  if opts.bang then
    vim.g.disable_lint = 1
  else
    vim.b.disable_lint = 1
  end
end, {
  nargs = 0,
  desc = 'Disables linting on current buffer, suffix with ! to disable linting globally',
  bang = true,
})

cmd('EnableLint', function(opts)
  if opts.bang then
    vim.g.disable_lint = 0
  else
    vim.b.disable_lint = 0
  end
end, {
  nargs = 0,
  desc = 'Reenable linting on current buffer, suffix with ! to enable linting globally',
  bang = true,
})

local sessions = require('mini.sessions')

cmd('RestartSession', function()
  pcall(sessions.delete, nil, { force = true })

  Snacks.bufdelete.all()
end, {
  nargs = 0,
  desc = 'Delete session and close all bufers',
})
