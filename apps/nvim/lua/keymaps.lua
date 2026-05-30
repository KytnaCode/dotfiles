local map = vim.keymap.set

--- @type vim.keymap.set.Opts
local default_opts = {
  noremap = true,
}

--- @param extend vim.keymap.set.Opts?
--- @return vim.keymap.set.Opts
local function opts(extend)
  return vim.tbl_extend('force', default_opts, extend)
end

-- Editing
map('n', 'd', '"_d', opts({ desc = 'delete' }))
map({ 'n', 'o' }, 'x', 'd', opts({ desc = 'cut' }))

-- File tree.
map('n', '<leader>tt', '<CMD>Neotree toggle<CR>', opts({ desc = 'Toggle file tree' }))

-- Motion.
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', opts({ desc = 'Leap within window' }))
map('n', 'S', '<Plug>(leap-from-window)', opts({ desc = 'Leap from window' }))

-- Buffers.
map('n', [[<c-,>]], '<CMD>BufferLineCyclePrev<CR>', opts({ desc = 'Previous buffer' }))
map('n', [[<c-.>]], '<CMD>BufferLineCycleNext<CR>', opts({ desc = 'Next buffer' }))
map('n', [[<c-m-,>]], '<CMD>BufferLineMovePrev<CR>', opts({ desc = 'Move current buffer left' }))
map('n', [[<c-m-.>]], '<CMD>BufferLineMoveNext<CR>', opts({ desc = 'Move current buffer right' }))
map('n', [[<c-x>]], '<CMD>Bdelete<CR>', opts({ desc = 'delete buffer' }))
map('n', [[<c-m-x>]], '<CMD>Bwipeout<CR>', opts({ desc = 'wipeout buffer' }))

-- Git
map('n', '<leader>gc', '<CMD>Git commit --verbose<CR>', opts({ desc = 'Commit stagged changes' }))
map('n', '<leader>gn', '<CMD>Git commit --amend<CR>', opts({ desc = 'Commit amend' }))
map('n', '<leader>gl', '<CMD>Git log<CR>', opts({ desc = 'Open git logs' }))

-- Terminal
map({ 'n', 't' }, [[<c-\>]], '<CMD>ToggleTerm direction=float<CR>', opts({ desc = 'toggle floating terminal' }))
