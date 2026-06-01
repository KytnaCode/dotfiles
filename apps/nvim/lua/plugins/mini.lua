return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup()

    require('mini.move').setup()

    require('mini.operators').setup()

    require('mini.splitjoin').setup()

    require('mini.animate').setup()

    require('mini.cursorword').setup()

    require('mini.indentscope').setup()

    require('mini.sessions').setup({
      autoread = true,
    })
  end,
}
