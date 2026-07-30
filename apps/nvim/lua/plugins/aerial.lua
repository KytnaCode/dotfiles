return {
  'stevearc/aerial.nvim',
  opts = {
    on_attach = function(bufnr)
      local map = vim.keymap.set

      map('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      map('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
  },
}
