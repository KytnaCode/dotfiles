local map = vim.keymap.set

--- @type vim.keymap.set.Opts
local default_opts = {
  noremap = true,
}

--- @param extend vim.keymap.set.Opts?
--- @return vim.keymap.set.Opts
local function opts(extend) return vim.tbl_extend('force', default_opts, extend) end

-- File tree.
map('n', '<leader>tt', '<CMD>Neotree toggle<CR>', opts({ desc = 'Toggle file tree' }))

-- Motion.
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', opts({ desc = 'Leap within window' }))
map('n', 'S', '<Plug>(leap-from-window)', opts({ desc = 'Leap from window' }))

-- Git
map('n', '<leader>gc', '<CMD>Git commit<CR>', opts({ desc = 'Commit stagged changes' }))
map('n', '<leader>ga', '<CMD>Git commit --amend --no-edit<CR>', opts({ desc = 'Commit amend' }))
map('n', '<leader>gl', '<CMD>Git log<CR>', opts({ desc = 'Open git logs' }))
map('n', '<leader>ga', '<CMD>Git add %<CR>', opts({ desc = 'Git add current file' }))
map('n', '<leader>gr', '<CMD>Git reset %<CR>', opts({ desc = 'Git reset current file' }))

-- Terminal
map({ 'n', 't' }, [[<c-\>]], '<CMD>ToggleTerm direction=float<CR>', opts({ desc = 'toggle floating terminal' }))
