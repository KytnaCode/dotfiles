return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  opts = {
    left = {
      {
        ft = 'neo-tree',
        size = { width = 0.25 },
      },
    },
    right = {
      {
        ft = 'help',
        size = { width = 0.4 },
        filter = function(buf) return vim.bo[buf].buftype == 'help' end,
      },
      {
        ft = 'git',
        size = { width = 0.35 },
      },
      {
        ft = 'gitcommit',
        size = { width = 0.4 },
      },
    },
  },
}
