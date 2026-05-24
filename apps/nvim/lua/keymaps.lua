local map = vim.keymap.set

-- File tree.
map("n", "<leader>tt", "<CMD>Neotree toggle<CR>")

-- Motion.
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
map('n', 'S', '<Plug>(leap-from-window)')

-- Git
map('n', '<leader>gc', '<CMD>Git commit<CR>')

-- Terminal
map({ 'n', 't' }, [[<c-\>]], '<CMD>ToggleTerm direction=float<CR>')
