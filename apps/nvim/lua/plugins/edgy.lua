return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  --- @module "edgy.config"
  --- @type Edgy.Config
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
        filter = function(buf)
          return vim.bo[buf].buftype == 'help'
        end,
      },
      {
        ft = 'aerial',
        size = { width = 0.4 },
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
    --- @type (Edgy.View.Opts|string)[]
    bottom = {
      {
        ft = 'trouble',
        size = { height = 0.15 },
      },
    },
  },
}
